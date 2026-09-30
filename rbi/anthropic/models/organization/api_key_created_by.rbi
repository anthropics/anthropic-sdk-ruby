# typed: strong

module Anthropic
  module Models
    module Organization
      class APIKeyCreatedBy < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::APIKeyCreatedBy,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the actor that created the object.
        sig { returns(String) }
        attr_accessor :id

        # Type of the actor that created the object.
        sig do
          returns(Anthropic::Organization::APIKeyCreatedBy::Type::TaggedSymbol)
        end
        attr_accessor :type

        sig do
          params(
            id: String,
            type: Anthropic::Organization::APIKeyCreatedBy::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the actor that created the object.
          id:,
          # Type of the actor that created the object.
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type: Anthropic::Organization::APIKeyCreatedBy::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Type of the actor that created the object.
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Organization::APIKeyCreatedBy::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SERVICE_ACCOUNT =
            T.let(
              :service_account,
              Anthropic::Organization::APIKeyCreatedBy::Type::TaggedSymbol
            )
          USER =
            T.let(
              :user,
              Anthropic::Organization::APIKeyCreatedBy::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::APIKeyCreatedBy::Type::TaggedSymbol
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
