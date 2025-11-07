# frozen_string_literal: true

module Anthropic
  module Helpers
    module InputSchema
      # Represents a response from Anthropic's API where the model's output has been structured according to a schema predefined by the user.
      #
      # This class is specifically used when making requests with the `input_schema` parameter.
      #
      # See {examples/input_schemas.rb} for a complete example of use
      class BaseModel < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Helpers::InputSchema::JsonSchemaConverter

        class << self
          # @return [Hash{Symbol=>Object}]
          def to_json_schema = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema(self)

          # @api private
          #
          # @param state [Hash{Symbol=>Object}]
          #
          #   @option state [Hash{Object=>String}] :defs
          #
          #   @option state [Array<String>] :path
          #
          # @return [Hash{Symbol=>Object}]
          def to_json_schema_inner(state:)
            Anthropic::Helpers::InputSchema::JsonSchemaConverter.cache_def!(state, type: self) do
              path = state.fetch(:path)
              properties = fields.to_h do |name, field|
                type, nilable, meta = field.fetch_values(:type, :nilable, :meta)
                new_state = {**state, path: [*path, ".#{name}"]}

                schema =
                  case type
                  in Anthropic::Helpers::InputSchema::JsonSchemaConverter
                    type.to_json_schema_inner(state: new_state)
                  else
                    Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema_inner(
                      type,
                      state: new_state
                    )
                  end
                Anthropic::Helpers::InputSchema::JsonSchemaConverter.assoc_meta!(schema, meta: meta)
                schema = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_nilable(schema) if nilable

                [name, schema]
              end

              {
                type: "object",
                properties: properties,
                required: fields.select { _2.fetch(:required) }.keys.map(&:to_s),
                additionalProperties: false
              }.tap { _1.store(:description, @doc_string) unless @doc_string.nil? }
            end
          end
        end

        class << self
          def required(name_sym, type_info, *args)
            spec = process_field_args(args)
            super(name_sym, type_info, spec)
          end

          def optional(name_sym, type_info, *args)
            spec = process_field_args(args)
            super(name_sym, type_info, spec)
          end

          # @return [String]
          attr_reader :doc_string

          # @api public
          #
          # @param description [String]
          def description(description) = (@doc_string = description)

          alias_method :doc, :description

          private def process_field_args(args)
            # Only accept hash format for descriptions.
            args.grep(Hash).first.to_h
          end
        end
      end
    end
  end
end
