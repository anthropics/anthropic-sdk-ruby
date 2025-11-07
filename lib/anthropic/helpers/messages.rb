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
            # rubocop:disable Metrics/BlockLength
            mapped = tool_array.map do |tool|
              case tool
              # Direct tool class:
              in Anthropic::Helpers::InputSchema::JsonSchemaConverter
                classname = tool.is_a?(Anthropic::Helpers::Tools::BaseTool) ? tool.class.name : tool.name
                name = classname
                       .split("::")
                       .last
                       .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
                       .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                       .downcase
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
          else
          end
          # rubocop:enable Metrics/BlockLength

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
      end
    end
  end
end
