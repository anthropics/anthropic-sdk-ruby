# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookVaultCredentialDeletedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the resource that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"vault_credential.deleted"]
        required :type, const: :"vault_credential.deleted"

        # @!attribute vault_id
        #   ID of the vault that owns this credential.
        #
        #   @return [String]
        required :vault_id, String

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, vault_id:, workspace_id:, type: :"vault_credential.deleted")
        #   @param id [String] ID of the resource that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param vault_id [String] ID of the vault that owns this credential.
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"vault_credential.deleted"]
      end
    end

    BetaWebhookVaultCredentialDeletedEventData = Beta::BetaWebhookVaultCredentialDeletedEventData
  end
end
