# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tools
      class BaseTool
        include Anthropic::Internal::Type::Converter
        include Anthropic::Helpers::InputSchema::JsonSchemaConverter

        class << self
          # @api public
          #
          # @return [Class<Anthropic::Helpers::InputSchema::BaseModel>]
          attr_reader :model

          # @return [String]
          attr_reader :doc_string

          # @api private
          #
          # When set, the runner uses this literal string as the API tool name instead of
          # snake-casing the class name. Used by helpers (e.g. MCP) that build tools
          # dynamically from an external definition.
          #
          # @return [String, nil]
          attr_accessor :tool_name

          # @api public
          #
          # @param description [String]
          def description(description) = (@doc_string = description)

          alias_method :doc, :description

          # @api public
          #
          # @model [Class<Anthropic::Helpers::InputSchema::BaseModel>]
          def input_schema(model) = (@model = model)

          # @api public
          #
          # Declares additional properties for this tool's API definition, sent alongside the
          # `name`, `description` and `input_schema` — e.g. `strict`, `cache_control`,
          # `defer_loading`, `allowed_callers`, `eager_input_streaming` or `input_examples`.
          #
          # Options accumulate: each call merges into what was already declared, and a subclass
          # starts from its superclass's options. Called without an argument, returns the declared
          # options as a frozen hash.
          #
          # @example
          #   class GetWeather < Anthropic::BaseTool
          #     doc "Get the current weather in a given location"
          #     input_schema GetWeatherInput
          #     tool_options strict: true, cache_control: {type: :ephemeral}
          #   end
          #
          # @param options [Hash{Symbol=>Object}, nil]
          #
          # @return [Hash{Symbol=>Object}]
          def tool_options(options = nil)
            if options.nil?
              return @tool_options if @tool_options

              # Nothing declared on this class: read through to the superclass (`BaseTool` has none).
              return superclass.respond_to?(:tool_options) ? superclass.tool_options : {}.freeze
            end

            options = Anthropic::Internal::Util.coerce_hash!(options).to_h.transform_keys(&:to_sym)
            # These either have their own declaration or are derived from the class; letting them
            # through would desync the definition sent to the API from how responses are parsed.
            reserved = options.keys & [:name, :description, :input_schema]
            unless reserved.empty?
              message =
                "#{reserved.map { "`#{_1}`" }.join(', ')} cannot be set through `tool_options`; " \
                "use `doc` and `input_schema` instead (the tool name is derived from the class name)."
              raise ArgumentError.new(message)
            end

            # Frozen so the stored declaration can't drift from what was validated above.
            @tool_options = Anthropic::Internal::Util.deep_frozen_copy(tool_options.merge(options))
          end

          # @api private
          #
          # @deprecated Use {.tool_options}.
          #
          # @return [Hash{Symbol=>Object}]
          def tool_extra_props = tool_options

          # @api private
          #
          # @deprecated Use {.tool_options}.
          #
          # @param props [Hash{Symbol=>Object}, nil]
          def tool_extra_props=(props)
            warn(
              "[DEPRECATION] `tool_extra_props=` is deprecated. Use `tool_options` instead.",
              category: :deprecated
            )
            tool_options(props.to_h)
          end

          # @api private
          #
          # @param depth [Integer]
          def inspect(depth: 0)
            # Only hand-written tools carry an input schema class here; helper-built tools (e.g. MCP)
            # hold a plain class and an undeclared schema is nil, neither of which takes `depth:`.
            schema = model.is_a?(Anthropic::Internal::Type::Converter) ? model.inspect(depth:) : model.inspect
            "#{name || tool_name}[#{schema}]"
          end
        end

        # @api private
        #
        def to_json_schema_inner(state:) = self.class.model&.to_json_schema_inner(state:)

        # @api private
        #
        def to_json_schema = self.class.model&.to_json_schema

        # @api private
        #
        def dump(value, state:)
          Anthropic::Internal::Type::Converter.dump(self.class.model, value, state:)
        end

        # @api private
        #
        def coerce(value, state:)
          parsed = parse(value)
          Anthropic::Internal::Type::Converter.coerce(self.class.model, parsed, state:)
        end

        # rubocop:disable Lint/UnusedMethodArgument

        # @api public
        #
        # Override the `#parse` method to customize the pre-processing of the tool call argument
        #
        # @param value [Object]
        #
        # @return [Object]
        def parse(value) = value

        # @api public
        #
        # @param parsed [Anthropic::Helpers::InputSchema::BaseModel]
        def call(parsed) = raise NotImplementedError.new

        # rubocop:enable Lint/UnusedMethodArgument

        # @api private
        #
        def inspect = "#<#{self.class.inspect(depth: 1)}:0x#{object_id.to_s(16)}>"
      end
    end
  end
end
