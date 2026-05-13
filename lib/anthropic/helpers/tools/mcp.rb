# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tools
      # Helpers for integrating Model Context Protocol (MCP) servers with the
      # Anthropic SDK.
      #
      # These helpers convert types returned by the `mcp` gem into the shapes
      # the Beta Messages API accepts, so you don't have to write glue code
      # yourself.
      #
      # The `mcp` gem is an optional dependency; install it separately:
      #
      #     gem install mcp
      #
      # @example Convert MCP tools and run them through `tool_runner`
      #   require "mcp"
      #   require "anthropic"
      #
      #   transport  = MCP::Client::HTTP.new(url: "https://example.com/mcp")
      #   mcp_client = MCP::Client.new(transport: transport)
      #   anthropic  = Anthropic::Client.new
      #
      #   runner = anthropic.beta.messages.tool_runner(
      #     model: "claude-sonnet-4-5",
      #     max_tokens: 1024,
      #     messages: [{role: "user", content: "Use the available tools"}],
      #     tools: Anthropic::Mcp.tools(mcp_client.tools, mcp_client)
      #   )
      #   runner.run_until_finished
      module Mcp
        SUPPORTED_IMAGE_TYPES = Set.new(%w[image/jpeg image/png image/gif image/webp]).freeze

        # Raised when an MCP value cannot be converted to a format supported by
        # the Claude API.
        class UnsupportedMCPValueError < Anthropic::Errors::Error; end

        # @api private
        #
        # Runnable tool backing {Anthropic::Mcp.tool}. Each call to {build} produces
        # a fresh anonymous subclass — that subclass owns a unique inner "parsed
        # input" class so the runner can dispatch tool calls via
        # `class.model === tool_use.parsed`, the same path used by hand-written
        # {Anthropic::BaseTool} subclasses.
        class Tool < Anthropic::Helpers::Tools::BaseTool
          class << self
            attr_accessor :mcp_input_schema, :mcp_client
          end

          def self.build(
            mcp_tool:,
            mcp_client:,
            cache_control: nil,
            defer_loading: nil,
            allowed_callers: nil,
            eager_input_streaming: nil,
            input_examples: nil,
            strict: nil
          )
            api_name, description, raw_schema = Mcp.send(:extract_tool_fields, mcp_tool)
            raise ArgumentError, "MCP tool is missing a `name`" if api_name.to_s.empty?

            extras = {
              cache_control: cache_control,
              defer_loading: defer_loading,
              allowed_callers: allowed_callers,
              eager_input_streaming: eager_input_streaming,
              input_examples: input_examples,
              strict: strict
            }.compact

            input_class = Class.new(Hash)

            klass = Class.new(self)
            klass.description(description) if description
            klass.tool_name = api_name
            klass.tool_extra_props = extras
            klass.mcp_input_schema = Mcp.send(:normalize_schema, raw_schema)
            klass.mcp_client = mcp_client
            klass.instance_variable_set(:@model, input_class)
            klass.new
          end

          # Return a deep copy of the raw schema; `SupportedSchemas.transform_schema!`
          # mutates the hash it receives.
          def to_json_schema_inner(state:)
            _ = state
            Marshal.load(Marshal.dump(self.class.mcp_input_schema))
          end

          def to_json_schema
            Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema(self)
          end

          # MCP arguments are opaque JSON objects — pass through unchanged. The
          # returned object is an instance of this subclass's per-tool `model`,
          # which is both a Hash (for downstream serialization) and uniquely
          # typed so the runner can identify which MCP tool the parsed input
          # belongs to.
          def coerce(value, state:)
            state.fetch(:exactness)[:yes] += 1
            wrapper = self.class.model.new
            input = if value.is_a?(Hash)
              value
            else
              (value.respond_to?(:to_h) ? value.to_h : {})
            end
            input.each { |k, v| wrapper[k] = v }
            wrapper
          end

          def call(parsed)
            args = parsed.is_a?(Hash) ? parsed.to_h : parsed
            response = self.class.mcp_client.call_tool(name: self.class.tool_name, arguments: args)
            Mcp.send(:convert_tool_result, response)
          end
        end

        class << self
          # Convert an MCP tool definition into a runnable tool for `tool_runner`.
          #
          # @param mcp_tool [MCP::Client::Tool, Hash] An MCP tool, typically from
          #   `mcp_client.list_tools` / `mcp_client.tools`. May be a typed
          #   `MCP::Client::Tool` or a hash with `:name`, `:description`,
          #   `:input_schema` (or `:inputSchema`).
          # @param mcp_client [#call_tool] The MCP client used to invoke the tool.
          # @param cache_control [Hash, nil] Prompt-caching control passed through
          #   to the tool definition.
          # @param defer_loading [Boolean, nil] If true, the tool is excluded
          #   from the initial system prompt.
          # @param allowed_callers [Array<Symbol, String>, nil] Restricts which
          #   callers may invoke the tool.
          # @param eager_input_streaming [Boolean, nil] Enables eager input
          #   streaming for the tool.
          # @param input_examples [Array<Hash>, nil] Example inputs for the tool.
          # @param strict [Boolean, nil] When true, guarantees schema validation
          #   on tool names and inputs.
          # @return [Anthropic::Helpers::Tools::Mcp::Tool]
          def tool(
            mcp_tool,
            mcp_client,
            cache_control: nil,
            defer_loading: nil,
            allowed_callers: nil,
            eager_input_streaming: nil,
            input_examples: nil,
            strict: nil
          )
            require_mcp!
            Tool.build(
              mcp_tool: mcp_tool,
              mcp_client: mcp_client,
              cache_control: cache_control,
              defer_loading: defer_loading,
              allowed_callers: allowed_callers,
              eager_input_streaming: eager_input_streaming,
              input_examples: input_examples,
              strict: strict
            )
          end

          # Convert a list of MCP tools into runnable tools.
          #
          # @param mcp_tools [Array<MCP::Client::Tool, Hash>]
          # @param mcp_client [#call_tool]
          # @return [Array<Anthropic::Helpers::Tools::Mcp::Tool>]
          def tools(mcp_tools, mcp_client, **opts)
            mcp_tools.map { tool(_1, mcp_client, **opts) }
          end

          # Convert an MCP prompt message into a Beta message parameter.
          #
          # @param mcp_message [MCP::Prompt::Message, Hash]
          # @param cache_control [Hash, nil] Forwarded to the produced content block.
          # @return [Hash]
          def message(mcp_message, cache_control: nil)
            require_mcp!
            h = to_hash!(mcp_message, "MCP prompt message")
            role = hkey(h, :role)
            role = role.to_sym if role.respond_to?(:to_sym)
            {
              role: role,
              content: [content(hkey(h, :content), cache_control: cache_control)]
            }
          end

          # Convert a single MCP content item into a Beta content block.
          #
          # Handles text, image, and embedded resource content types. Raises
          # {UnsupportedMCPValueError} for audio or resource_link types.
          #
          # @param mcp_content [MCP::Content::Text, MCP::Content::Image,
          #   MCP::Content::EmbeddedResource, Hash]
          # @param cache_control [Hash, nil]
          # @return [Hash]
          def content(mcp_content, cache_control: nil)
            require_mcp!
            h = to_hash!(mcp_content, "MCP content")
            block = convert_content(h)
            block[:cache_control] = cache_control if cache_control
            block
          end

          # Convert MCP resource read results into Beta content blocks — one
          # per item in `contents`. Raises {UnsupportedMCPValueError} on any
          # item whose MIME type is unsupported.
          #
          # @param result [Hash, Array, #contents] The result from
          #   `mcp_client.read_resource(uri: ...)`. The `mcp` gem returns just
          #   the contents array — both that and a `{contents: [...]}` hash are
          #   accepted.
          # @param cache_control [Hash, nil] Forwarded to each produced block.
          # @return [Array<Hash>]
          def resource_to_contents(result, cache_control: nil)
            require_mcp!
            contents = extract_resource_contents(result)
            if contents.empty?
              raise UnsupportedMCPValueError,
                    "Resource contents array must contain at least one item"
            end

            contents.map do |item|
              block = resource_contents_to_block(to_hash!(item, "resource"))
              block[:cache_control] = cache_control if cache_control
              block
            end
          end

          # Convert MCP resource read results into {Anthropic::FilePart}
          # instances suitable for `client.beta.files.upload(file: ...)`. No
          # MIME filtering — every item in `contents` becomes a file.
          #
          # @param result [Hash, Array, #contents]
          # @return [Array<Anthropic::FilePart>]
          def resource_to_files(result)
            require_mcp!
            contents = extract_resource_contents(result)
            if contents.empty?
              raise UnsupportedMCPValueError,
                    "Resource contents array must contain at least one item"
            end

            contents.map do |item|
              resource = to_hash!(item, "resource")
              Anthropic::FilePart.new(
                StringIO.new(resource_bytes(resource)),
                filename: filename_from_uri(hkey(resource, :uri)),
                content_type: hkey(resource, :mimeType)
              )
            end
          end

          # @api private
          # Called by {Tool#call}; converts a JSON-RPC `tools/call` response
          # into the value the tool runner expects.
          def convert_tool_result(response)
            result = nested_result(response)
            is_error = hkey(result, :isError)
            content_items = hkey(result, :content) || []
            structured = hkey(result, :structuredContent)

            if is_error
              blocks = content_items.map { content(_1) }
              raise Anthropic::Errors::Error, render_error_blocks(blocks)
            end

            return JSON.generate(structured) if content_items.empty? && structured

            content_items.map { content(_1) }
          end

          # -- conversion internals -------------------------------------------

          private def convert_content(h)
            type = hkey(h, :type).to_s
            case type
            when "text"
              text = hkey(h, :text)
              {type: :text, text: text.to_s}
            when "image"
              data = hkey(h, :data)
              mime = hkey(h, :mimeType)
              unless supported_image_mime?(mime)
                raise UnsupportedMCPValueError, "Unsupported image MIME type: #{mime}"
              end
              {type: :image, source: {type: :base64, data: data, media_type: mime}}
            when "resource"
              resource = hkey(h, :resource)
              resource_contents_to_block(to_hash!(resource, "embedded resource"))
            else
              # Covers "audio", "resource_link", and any unrecognized type.
              raise UnsupportedMCPValueError, "Unsupported MCP content type: #{type}"
            end
          end

          private def resource_contents_to_block(resource)
            mime = hkey(resource, :mimeType)
            uri = hkey(resource, :uri)
            text = hkey(resource, :text)
            # `mcp/sdk` schema uses `blob`; the Ruby `mcp` gem's BlobContents#to_h also uses `blob`.
            blob = hkey(resource, :blob)

            if mime && supported_image_mime?(mime)
              if blob.nil?
                raise UnsupportedMCPValueError,
                      "Image resource must have blob data, not text. URI: #{uri}"
              end
              return {type: :image, source: {type: :base64, data: blob, media_type: mime}}
            end

            if mime == "application/pdf"
              if blob.nil?
                raise UnsupportedMCPValueError,
                      "PDF resource must have blob data, not text. URI: #{uri}"
              end
              return {type: :document, source: {type: :base64, data: blob, media_type: "application/pdf"}}
            end

            if mime.nil? || mime.start_with?("text/")
              data = if !text.nil?
                text.to_s
              elsif !blob.nil?
                Base64.decode64(blob.to_s).force_encoding(Encoding::UTF_8)
              else
                ""
              end
              return {type: :document, source: {type: :text, data: data, media_type: "text/plain"}}
            end

            raise UnsupportedMCPValueError, "Unsupported MIME type \"#{mime}\" for resource: #{uri}"
          end

          private def extract_resource_contents(result)
            case result
            when Array
              result
            when Hash
              result[:contents] || result["contents"] || []
            else
              if result.respond_to?(:contents)
                result.contents
              elsif result.respond_to?(:to_h)
                h = result.to_h
                h[:contents] || h["contents"] || []
              else
                []
              end
            end
          end

          private def resource_bytes(resource)
            text = hkey(resource, :text)
            blob = hkey(resource, :blob)

            return Base64.decode64(blob.to_s) unless blob.nil?
            return text.to_s.dup.force_encoding(Encoding::UTF_8) unless text.nil?

            "".dup
          end

          private def filename_from_uri(uri)
            return "file" if uri.nil? || uri.to_s.empty?

            path =
              begin
                URI.parse(uri.to_s).path
              rescue URI::InvalidURIError
                uri.to_s
              end
            base = path.to_s.split("/").last
            base.nil? || base.empty? ? "file" : base
          end

          private def render_error_blocks(blocks)
            parts = blocks.map do |b|
              if b[:type] == :text
                b[:text].to_s
              else
                JSON.generate(b)
              end
            end
            joined = parts.reject(&:empty?).join("\n")
            joined.empty? ? "MCP tool reported an error" : joined
          end

          private def nested_result(response)
            return {} if response.nil?

            r = response
            r = r["result"] || r[:result] || r if r.is_a?(Hash) && (r.key?("result") || r.key?(:result))
            r.is_a?(Hash) ? r : {}
          end

          # -- input shape helpers --------------------------------------------

          private def extract_tool_fields(mcp_tool)
            if mcp_tool.is_a?(Hash)
              [
                hkey(mcp_tool, :name),
                hkey(mcp_tool, :description),
                hkey(mcp_tool, :input_schema) || hkey(mcp_tool, :inputSchema)
              ]
            else
              name = mcp_tool.respond_to?(:name) ? mcp_tool.name : nil
              description = mcp_tool.respond_to?(:description) ? mcp_tool.description : nil
              schema =
                if mcp_tool.respond_to?(:input_schema)
                  mcp_tool.input_schema
                elsif mcp_tool.respond_to?(:inputSchema)
                  mcp_tool.inputSchema
                end
              [name, description, schema]
            end
          end

          # `mcp/sdk` requires `properties` and `required` to be present (even
          # if null) on the API side. Normalize the gem's string-keyed
          # JSON-Schema hashes into the symbol-keyed shape the SDK serializes.
          private def normalize_schema(raw)
            schema = raw.nil? ? {} : deep_symbolize_keys(raw)
            schema[:type] ||= :object
            schema[:properties] = nil unless schema.key?(:properties)
            schema[:required] = nil unless schema.key?(:required)
            schema
          end

          private def deep_symbolize_keys(obj)
            case obj
            in Hash
              obj.each_with_object({}) do |(k, v), acc|
                key = k.is_a?(String) ? k.to_sym : k
                acc[key] = deep_symbolize_keys(v)
              end
            in Array
              obj.map { deep_symbolize_keys(_1) }
            else
              obj
            end
          end

          # Reads a value from a hash that may use either symbol or string keys.
          # The Ruby `mcp` gem returns string-keyed hashes from transport layers
          # but symbol-keyed hashes from typed objects' `to_h`.
          private def hkey(h, key)
            return nil unless h.is_a?(Hash)

            sym = key.to_sym
            str = key.to_s
            return h[sym] if h.key?(sym)
            return h[str] if h.key?(str)

            nil
          end

          private def to_hash!(obj, label)
            return obj if obj.is_a?(Hash)
            return obj.to_h if obj.respond_to?(:to_h)

            raise UnsupportedMCPValueError,
                  "Expected #{label} to be a Hash or to-hashable object, got #{obj.class}"
          end

          private def supported_image_mime?(mime)
            return false unless mime.is_a?(String)

            SUPPORTED_IMAGE_TYPES.include?(mime)
          end

          private def require_mcp!
            return if defined?(::MCP)

            begin
              require("mcp")
            rescue LoadError
              raise LoadError,
                    "The `mcp` gem is required to use Anthropic's MCP helpers. " \
                    "Install it by adding `gem \"mcp\"` to your Gemfile (or running `gem install mcp`)."
            end
          end
        end
      end
    end
  end
end
