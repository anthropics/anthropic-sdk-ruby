# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeletedVault = Beta::BetaManagedAgentsDeletedVault

    module Beta
      class BetaManagedAgentsDeletedVault < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeletedVault,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier of the deleted vault.
        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeletedVault::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Confirmation of a deleted vault.
        sig do
          params(
            id: String,
            type: Anthropic::Beta::BetaManagedAgentsDeletedVault::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier of the deleted vault.
          id:,
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsDeletedVault::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsDeletedVault::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VAULT_DELETED =
            T.let(
              :vault_deleted,
              Anthropic::Beta::BetaManagedAgentsDeletedVault::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeletedVault::Type::TaggedSymbol
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
