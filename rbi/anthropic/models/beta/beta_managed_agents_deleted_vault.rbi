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

        # The unique ID of the deleted vault (`vlt_...`).
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :type

        # Confirmation of a deleted vault.
        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The unique ID of the deleted vault (`vlt_...`).
          id:,
          type: :vault_deleted
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
