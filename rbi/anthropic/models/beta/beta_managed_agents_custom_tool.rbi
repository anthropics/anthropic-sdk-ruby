# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCustomTool = Beta::BetaManagedAgentsCustomTool

    module Beta
      class BetaManagedAgentsCustomTool < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCustomTool,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :description

        # JSON Schema for custom tool input parameters.
        sig { returns(Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema) }
        attr_reader :input_schema

        sig do
          params(
            input_schema:
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::OrHash
          ).void
        end
        attr_writer :input_schema

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # A custom tool as returned in API responses.
        sig do
          params(
            description: String,
            input_schema:
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::OrHash,
            name: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          description:,
          # JSON Schema for custom tool input parameters.
          input_schema:,
          name:,
          type: :custom
        )
        end

        sig do
          override.returns(
            {
              description: String,
              input_schema:
                Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema,
              name: String,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
