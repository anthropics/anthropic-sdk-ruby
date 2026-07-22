# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookEnvironmentArchivedEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :"environment.archived"]
        required :type, const: :"environment.archived"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"environment.archived")
        #   @param id [String] ID of the environment that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"environment.archived"]
      end
    end

    BetaWebhookEnvironmentArchivedEventData = Beta::BetaWebhookEnvironmentArchivedEventData
  end
end
