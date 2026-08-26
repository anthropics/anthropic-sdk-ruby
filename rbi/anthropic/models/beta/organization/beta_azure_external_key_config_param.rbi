# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAzureExternalKeyConfigParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam,
                Anthropic::Internal::AnyHash
              )
            end

          # Name of the key within the vault.
          sig { returns(String) }
          attr_accessor :key_name

          # Azure AD tenant ID.
          sig { returns(String) }
          attr_accessor :tenant_id

          sig { returns(Symbol) }
          attr_accessor :type

          # Key Vault data-plane URI — `https://{vault-name}.vault.azure.net` or
          # `https://{hsm-name}.managedhsm.azure.net`.
          sig { returns(String) }
          attr_accessor :vault_uri

          # Azure AD application (client) ID. Omit to use Anthropic's multitenant app.
          # Provide only if using a single-tenant app registration in the customer's
          # directory.
          sig { returns(T.nilable(String)) }
          attr_accessor :client_id

          # Azure Key Vault provider configuration.
          sig do
            params(
              key_name: String,
              tenant_id: String,
              vault_uri: String,
              client_id: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Name of the key within the vault.
            key_name:,
            # Azure AD tenant ID.
            tenant_id:,
            # Key Vault data-plane URI — `https://{vault-name}.vault.azure.net` or
            # `https://{hsm-name}.managedhsm.azure.net`.
            vault_uri:,
            # Azure AD application (client) ID. Omit to use Anthropic's multitenant app.
            # Provide only if using a single-tenant app registration in the customer's
            # directory.
            client_id: nil,
            type: :azure
          )
          end

          sig do
            override.returns(
              {
                key_name: String,
                tenant_id: String,
                type: Symbol,
                vault_uri: String,
                client_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
