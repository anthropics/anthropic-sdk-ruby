# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCustomToolInputSchema =
      Beta::BetaManagedAgentsCustomToolInputSchema

    module Beta
      class BetaManagedAgentsCustomToolInputSchema < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :properties

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :required

        # JSON Schema for custom tool input parameters.
        sig do
          params(
            properties: T.nilable(T::Hash[Symbol, T.anything]),
            required: T.nilable(T::Array[String]),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(properties: nil, required: nil, type: :object)
        end

        sig do
          override.returns(
            {
              type: Symbol,
              properties: T.nilable(T::Hash[Symbol, T.anything]),
              required: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
