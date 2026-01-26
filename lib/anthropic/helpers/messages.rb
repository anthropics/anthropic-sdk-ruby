# frozen_string_literal: true

module Anthropic
  module Helpers
    module Messages
      class << self
        # @api private
        #
        # Extract tool models from the request and convert them to JSON Schema
        # Returns a hash mapping tool name to Ruby model.
        #
        # @param data [Hash{Sybmol=>Object}]
        #
        # @param strict [Boolean, nil]
        #
        # @return [Hash{String=>Class}, Hash{String=>Class}]
        def distill_input_schema_models!(data, strict:)
          tools = {}
          models = {}

          case data
          in {tools: Array => tool_array}
            mapped = tool_array.map do |tool|
              case tool
              # Direct tool class:
              in Anthropic::Helpers::InputSchema::JsonSchemaConverter
                classname = tool.is_a?(Anthropic::Helpers::Tools::BaseTool) ? tool.class.name : tool.name
                name = model_name(classname)

                description =
                  case tool
                  in Anthropic::Helpers::Tools::BaseTool
                    tool.class.doc_string || name
                  in Class if tool <= Anthropic::Helpers::InputSchema::BaseModel
                    tool.doc_string || name
                  else
                    name
                  end

                tools.store(name, tool)
                input_schema = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema(tool)
                {name:, description:, input_schema:}.tap { _1.update(strict:) if strict }
              # Tool with explicit name/description and BaseModel as input_schema:
              in {name: String => name,
                  input_schema: Anthropic::Helpers::InputSchema::JsonSchemaConverter => tool,
                  **rest}
                tools.store(name, tool)
                input_schema = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema(tool)
                rest.merge(name:, input_schema:).tap { _1.update(strict:) if strict }
              else
                # Any other format (pass through unchanged)
                # This includes raw JSON schemas and any other tool definitions.
                tool
              end
            end
            tool_array.replace(mapped)
          in {output_format: Anthropic::Helpers::InputSchema::JsonSchemaConverter => model}
            transform_output_format_to_output_config!(data, model:, models:)
          # rubocop:disable Lint/DuplicateBranch
          in {output_format: {schema: Anthropic::Helpers::InputSchema::JsonSchemaConverter => model}}
            # This branch handles output_format: {schema: Model} vs output_format: Model above
            transform_output_format_to_output_config!(data, model:, models:)
          # rubocop:enable Lint/DuplicateBranch
          in {output_config: {format: Anthropic::Helpers::InputSchema::JsonSchemaConverter => model}}
            # New API: output_config.format with model class
            name = model_name(model.name)
            models.store(name, model)
            schema = model.to_json_schema
            Anthropic::Helpers::InputSchema::SupportedSchemas.transform_schema!(schema)
            data.fetch(:output_config).store(:format, type: :json_schema, schema: schema)
            # Auto-inject beta header
            data[:betas] = data[:betas].to_a.dup.push("structured-outputs-2025-12-15").uniq
          else
          end

          [tools, models]
        end

        # @api private
        #
        # @param raw [Hash{Sybmol=>Object}]
        #
        # @param tools [Hash{String=>Class}]
        #
        # @param models [Hash{String=>Class}]
        #
        # @return [Hash{Sybmol=>Object}]
        def parse_input_schemas!(raw, tools:, models:)
          raw[:content]&.each do |content|
            case content
            in {type: "tool_use", name:, input:} if (tool = tools[name])
              begin
                coerced = Anthropic::Internal::Type::Converter.coerce(tool, input)

                content.store(:parsed, coerced)
              rescue StandardError => e
                content.store(:parsed, {error: e.message})
              end
            in {type: "text", text:} if (model = models.first&.last)
              begin
                json = JSON.parse(text, symbolize_names: true)
                coerced = Anthropic::Internal::Type::Converter.coerce(model, json)

                content.store(:parsed, coerced)
              rescue StandardError => e
                content.store(:parsed, {error: e.message})
              end
            else
            end
          end

          raw
        end

        # @api private
        #
        # Transform deprecated output_format to output_config.format
        #
        # @param data [Hash{Symbol=>Object}]
        # @param model [Class]
        # @param models [Hash{String=>Class}]
        private def transform_output_format_to_output_config!(data, model:, models:)
          warn(
            "[DEPRECATION] output_format is deprecated. Use output_config[:format] instead.",
            category: :deprecated
          )
          # Error if output_config exists but is not a hash
          if data.key?(:output_config) && !data[:output_config].is_a?(Hash)
            raise ArgumentError,
                  "output_config must be a Hash, got #{data[:output_config].class}"
          end
          # Error if both params are provided
          if data&.dig(:output_config, :format)
            raise ArgumentError,
                  "Both output_format and output_config[:format] were provided. " \
                  "Please use only output_config[:format] (output_format is deprecated)."
          end
          name = model_name(model.name)
          models.store(name, model)
          schema = model.to_json_schema
          Anthropic::Helpers::InputSchema::SupportedSchemas.transform_schema!(schema)
          output_config = data[:output_config].to_h
          output_config.store(:format, type: :json_schema, schema: schema)
          data.delete(:output_format)
          data[:output_config] = output_config
          # Auto-inject beta header
          data[:betas] = data[:betas].to_a.dup.push("structured-outputs-2025-12-15").uniq
        end

        # @api private
        #
        # @param classname [String]
        #
        # @return [String]
        private def model_name(classname)
          classname
            .split("::")
            .last
            .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .downcase
        end
      end
    end
  end
end
