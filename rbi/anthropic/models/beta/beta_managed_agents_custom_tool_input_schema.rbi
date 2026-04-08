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

        # JSON Schema properties defining the tool's input parameters.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :properties

        # List of required property names.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :required

        sig { params(required: T::Array[String]).void }
        attr_writer :required

        # Must be 'object' for tool input schemas.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # JSON Schema for custom tool input parameters.
        sig do
          params(
            properties: T.nilable(T::Hash[Symbol, T.anything]),
            required: T::Array[String],
            type:
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # JSON Schema properties defining the tool's input parameters.
          properties: nil,
          # List of required property names.
          required: nil,
          # Must be 'object' for tool input schemas.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              properties: T.nilable(T::Hash[Symbol, T.anything]),
              required: T::Array[String],
              type:
                Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Must be 'object' for tool input schemas.
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OBJECT =
            T.let(
              :object,
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
