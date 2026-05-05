# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookSessionThreadTerminatedEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :"session.thread_terminated"]
        required :type, const: :"session.thread_terminated"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"session.thread_terminated")
        #   @param id [String] ID of the resource that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"session.thread_terminated"]
      end
    end

    BetaWebhookSessionThreadTerminatedEventData = Beta::BetaWebhookSessionThreadTerminatedEventData
  end
end
