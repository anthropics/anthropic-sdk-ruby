# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookDeploymentPausedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the deployment that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"deployment.paused"]
        required :type, const: :"deployment.paused"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"deployment.paused")
        #   @param id [String] ID of the deployment that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"deployment.paused"]
      end
    end

    BetaWebhookDeploymentPausedEventData = Beta::BetaWebhookDeploymentPausedEventData
  end
end
