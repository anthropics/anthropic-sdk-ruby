# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookEnvironmentCreatedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the environment that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"environment.created"]
        required :type, const: :"environment.created"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"environment.created")
        #   @param id [String] ID of the environment that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"environment.created"]
      end
    end

    BetaWebhookEnvironmentCreatedEventData = Beta::BetaWebhookEnvironmentCreatedEventData
  end
end
