# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookDeploymentRunStartedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the deployment run that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"deployment_run.started"]
        required :type, const: :"deployment_run.started"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"deployment_run.started")
        #   @param id [String] ID of the deployment run that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"deployment_run.started"]
      end
    end

    BetaWebhookDeploymentRunStartedEventData = Beta::BetaWebhookDeploymentRunStartedEventData
  end
end
