# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookVaultCreatedEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :"vault.created"]
        required :type, const: :"vault.created"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"vault.created")
        #   @param id [String] ID of the resource that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"vault.created"]
      end
    end

    BetaWebhookVaultCreatedEventData = Beta::BetaWebhookVaultCreatedEventData
  end
end
