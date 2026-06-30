# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookAgentUpdatedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the agent that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"agent.updated"]
        required :type, const: :"agent.updated"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"agent.updated")
        #   @param id [String] ID of the agent that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"agent.updated"]
      end
    end

    BetaWebhookAgentUpdatedEventData = Beta::BetaWebhookAgentUpdatedEventData
  end
end
