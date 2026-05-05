# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookVaultArchivedEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :"vault.archived"]
        required :type, const: :"vault.archived"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"vault.archived")
        #   @param id [String] ID of the resource that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"vault.archived"]
      end
    end

    BetaWebhookVaultArchivedEventData = Beta::BetaWebhookVaultArchivedEventData
  end
end
