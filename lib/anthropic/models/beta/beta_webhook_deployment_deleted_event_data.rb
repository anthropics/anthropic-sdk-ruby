# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookDeploymentDeletedEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :"deployment.deleted"]
        required :type, const: :"deployment.deleted"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"deployment.deleted")
        #   @param id [String] ID of the deployment that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"deployment.deleted"]
      end
    end

    BetaWebhookDeploymentDeletedEventData = Beta::BetaWebhookDeploymentDeletedEventData
  end
end
