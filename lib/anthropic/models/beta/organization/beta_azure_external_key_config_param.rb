# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAzureExternalKeyConfigParam < Anthropic::Internal::Type::BaseModel
          # @!attribute key_name
          #   Name of the key within the vault.
          #
          #   @return [String]
          required :key_name, String

          # @!attribute tenant_id
          #   Azure AD tenant ID.
          #
          #   @return [String]
          required :tenant_id, String

          # @!attribute type
          #
          #   @return [Symbol, :azure]
          required :type, const: :azure

          # @!attribute vault_uri
          #   Key Vault data-plane URI — `https://{vault-name}.vault.azure.net` or
          #   `https://{hsm-name}.managedhsm.azure.net`.
          #
          #   @return [String]
          required :vault_uri, String

          # @!attribute client_id
          #   Azure AD application (client) ID. Omit to use Anthropic's multitenant app.
          #   Provide only if using a single-tenant app registration in the customer's
          #   directory.
          #
          #   @return [String, nil]
          optional :client_id, String, nil?: true

          # @!method initialize(key_name:, tenant_id:, vault_uri:, client_id: nil, type: :azure)
          #   Azure Key Vault provider configuration.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfigParam} for
          #   more details.
          #
          #   @param key_name [String] Name of the key within the vault.
          #
          #   @param tenant_id [String] Azure AD tenant ID.
          #
          #   @param vault_uri [String] Key Vault data-plane URI — `https://{vault-name}.vault.azure.net` or `https://{h
          #
          #   @param client_id [String, nil] Azure AD application (client) ID. Omit to use Anthropic's multitenant app. Provi
          #
          #   @param type [Symbol, :azure]
        end
      end
    end
  end
end
