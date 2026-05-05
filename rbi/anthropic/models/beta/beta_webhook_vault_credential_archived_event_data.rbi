# typed: strong

module Anthropic
  module Models
    BetaWebhookVaultCredentialArchivedEventData =
      Beta::BetaWebhookVaultCredentialArchivedEventData

    module Beta
      class BetaWebhookVaultCredentialArchivedEventData < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookVaultCredentialArchivedEventData,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the resource that triggered the event.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :organization_id

        sig { returns(Symbol) }
        attr_accessor :type

        # ID of the vault that owns this credential.
        sig { returns(String) }
        attr_accessor :vault_id

        sig { returns(String) }
        attr_accessor :workspace_id

        sig do
          params(
            id: String,
            organization_id: String,
            vault_id: String,
            workspace_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the resource that triggered the event.
          id:,
          organization_id:,
          # ID of the vault that owns this credential.
          vault_id:,
          workspace_id:,
          type: :"vault_credential.archived"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              organization_id: String,
              type: Symbol,
              vault_id: String,
              workspace_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
