# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookEnvironmentDeletedEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, Anthropic::Models::Beta::BetaWebhookEnvironmentDeletedEventType]
        required :type, enum: -> { Anthropic::Beta::BetaWebhookEnvironmentDeletedEventType }

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, type:, workspace_id:)
        #   @param id [String] ID of the environment that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaWebhookEnvironmentDeletedEventType]
        #
        #   @param workspace_id [String]
      end
    end

    BetaWebhookEnvironmentDeletedEventData = Beta::BetaWebhookEnvironmentDeletedEventData
  end
end
