# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyCreatedBy < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAPIKeyCreatedBy,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the actor that created the object.
          sig { returns(String) }
          attr_accessor :id

          # Type of the actor that created the object.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              id: String,
              type:
                Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type::OrSymbol
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
                type:
                  Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type::TaggedSymbol
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
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SERVICE_ACCOUNT =
              T.let(
                :service_account,
                Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type::TaggedSymbol
              )
            USER =
              T.let(
                :user,
                Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type::TaggedSymbol
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
end
