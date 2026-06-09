# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookSessionThreadCreatedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the session that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute session_thread_id
        #   ID of the session thread this event refers to.
        #
        #   @return [String]
        required :session_thread_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"session.thread_created"]
        required :type, const: :"session.thread_created"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, session_thread_id:, workspace_id:, type: :"session.thread_created")
        #   @param id [String] ID of the session that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param session_thread_id [String] ID of the session thread this event refers to.
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"session.thread_created"]
      end
    end

    BetaWebhookSessionThreadCreatedEventData = Beta::BetaWebhookSessionThreadCreatedEventData
  end
end
