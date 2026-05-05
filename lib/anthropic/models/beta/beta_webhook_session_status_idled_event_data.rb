# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookSessionStatusIdledEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :"session.status_idled"]
        required :type, const: :"session.status_idled"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"session.status_idled")
        #   @param id [String] ID of the resource that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"session.status_idled"]
      end
    end

    BetaWebhookSessionStatusIdledEventData = Beta::BetaWebhookSessionStatusIdledEventData
  end
end
