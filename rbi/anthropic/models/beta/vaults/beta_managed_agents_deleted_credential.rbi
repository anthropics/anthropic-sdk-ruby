# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsDeletedCredential < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier of the deleted credential.
          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Confirmation of a deleted credential.
          sig do
            params(
              id: String,
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier of the deleted credential.
            id:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VAULT_CREDENTIAL_DELETED =
              T.let(
                :vault_credential_deleted,
                Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type::TaggedSymbol
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
