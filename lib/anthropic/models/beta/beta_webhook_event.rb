# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique event identifier for idempotency.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   RFC 3339 timestamp when the event occurred.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute data
        #
        #   @return [Anthropic::Models::Beta::BetaWebhookSessionCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionPendingEventData, Anthropic::Models::Beta::BetaWebhookSessionRunningEventData, Anthropic::Models::Beta::BetaWebhookSessionIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionRequiresActionEventData, Anthropic::Models::Beta::BetaWebhookSessionArchivedEventData, Anthropic::Models::Beta::BetaWebhookSessionDeletedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRescheduledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRunStartedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData, Anthropic::Models::Beta::BetaWebhookVaultCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialRefreshFailedEventData]
        required :data, union: -> { Anthropic::Beta::BetaWebhookEventData }

        # @!attribute type
        #   Object type. Always `event` for webhook payloads.
        #
        #   @return [Symbol, :event]
        required :type, const: :event

        # @!method initialize(id:, created_at:, data:, type: :event)
        #   @param id [String] Unique event identifier for idempotency.
        #
        #   @param created_at [Time] RFC 3339 timestamp when the event occurred.
        #
        #   @param data [Anthropic::Models::Beta::BetaWebhookSessionCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionPendingEventData, Anthropic::Models::Beta::BetaWebhookSessionRunningEventData, Anthropic::Models::Beta::BetaWebhookSessionIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionRequiresActionEventData, Anthropic::Models::Beta::BetaWebhookSessionArchivedEventData, Anthropic::Models::Beta::BetaWebhookSessionDeletedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRescheduledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRunStartedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData, Anthropic::Models::Beta::BetaWebhookVaultCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialRefreshFailedEventData]
        #
        #   @param type [Symbol, :event] Object type. Always `event` for webhook payloads.
      end
    end

    BetaWebhookEvent = Beta::BetaWebhookEvent
  end
end
