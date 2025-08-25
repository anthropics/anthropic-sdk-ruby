# typed: strong

module Anthropic
  module Helpers
    module InputSchema
      JsonSchema = T.type_alias { Anthropic::Internal::AnyHash }

      # To customize the JSON schema conversion for a type, implement the `JsonSchemaConverter` interface.
      module JsonSchemaConverter
        POINTER = T.let(Object.new.freeze, T.anything)
        COUNTER = T.let(Object.new.freeze, T.anything)

        Input =
          T.type_alias do
            T.any(
              Anthropic::Helpers::InputSchema::JsonSchemaConverter,
              T::Class[T.anything]
            )
          end
        State =
          T.type_alias do
            { defs: T::Hash[Object, String], path: T::Array[String] }
          end

        # The exact JSON schema produced is subject to improvement between minor release versions.
        sig do
          params(
            state: Anthropic::Helpers::InputSchema::JsonSchemaConverter::State
          ).returns(Anthropic::Helpers::InputSchema::JsonSchema)
        end
        def to_json_schema_inner(state:)
        end

        # Internal helpers methods.
        class << self
          # @api private
          sig do
            params(schema: Anthropic::Helpers::InputSchema::JsonSchema).returns(
              Anthropic::Helpers::InputSchema::JsonSchema
            )
          end
          def to_nilable(schema)
          end

          # @api private
          sig do
            params(
              schema: Anthropic::Helpers::InputSchema::JsonSchema,
              meta: Anthropic::Internal::AnyHash
            ).void
          end
          def assoc_meta!(schema, meta:)
          end

          # @api private
          sig do
            params(
              state:
                Anthropic::Helpers::InputSchema::JsonSchemaConverter::State,
              type: Anthropic::Helpers::InputSchema::JsonSchemaConverter::Input,
              blk: T.proc.returns(Anthropic::Helpers::InputSchema::JsonSchema)
            ).void
          end
          def cache_def!(state, type:, &blk)
          end

          # @api private
          sig do
            params(
              type: Anthropic::Helpers::InputSchema::JsonSchemaConverter::Input
            ).returns(Anthropic::Helpers::InputSchema::JsonSchema)
          end
          def to_json_schema(type)
          end

          # @api private
          sig do
            params(
              type: Anthropic::Helpers::InputSchema::JsonSchemaConverter::Input,
              state: Anthropic::Helpers::InputSchema::JsonSchemaConverter::State
            ).returns(Anthropic::Helpers::InputSchema::JsonSchema)
          end
          def to_json_schema_inner(type, state:)
          end
        end
      end
    end
  end
end
