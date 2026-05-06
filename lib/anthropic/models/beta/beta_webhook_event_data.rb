# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaWebhookEventData
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :"session.created", -> { Anthropic::Beta::BetaWebhookSessionCreatedEventData }

        variant :"session.pending", -> { Anthropic::Beta::BetaWebhookSessionPendingEventData }

        variant :"session.running", -> { Anthropic::Beta::BetaWebhookSessionRunningEventData }

        variant :"session.idled", -> { Anthropic::Beta::BetaWebhookSessionIdledEventData }

        variant :"session.requires_action", -> { Anthropic::Beta::BetaWebhookSessionRequiresActionEventData }

        variant :"session.archived", -> { Anthropic::Beta::BetaWebhookSessionArchivedEventData }

        variant :"session.deleted", -> { Anthropic::Beta::BetaWebhookSessionDeletedEventData }

        variant :"session.status_rescheduled",
                -> { Anthropic::Beta::BetaWebhookSessionStatusRescheduledEventData }

        variant :"session.status_run_started", -> { Anthropic::Beta::BetaWebhookSessionStatusRunStartedEventData }

        variant :"session.status_idled", -> { Anthropic::Beta::BetaWebhookSessionStatusIdledEventData }

        variant :"session.status_terminated", -> { Anthropic::Beta::BetaWebhookSessionStatusTerminatedEventData }

        variant :"session.thread_created", -> { Anthropic::Beta::BetaWebhookSessionThreadCreatedEventData }

        variant :"session.thread_idled", -> { Anthropic::Beta::BetaWebhookSessionThreadIdledEventData }

        variant :"session.thread_terminated", -> { Anthropic::Beta::BetaWebhookSessionThreadTerminatedEventData }

        variant :"session.outcome_evaluation_ended",
                -> { Anthropic::Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData }

        variant :"vault.created", -> { Anthropic::Beta::BetaWebhookVaultCreatedEventData }

        variant :"vault.archived", -> { Anthropic::Beta::BetaWebhookVaultArchivedEventData }

        variant :"vault.deleted", -> { Anthropic::Beta::BetaWebhookVaultDeletedEventData }

        variant :"vault_credential.created", -> { Anthropic::Beta::BetaWebhookVaultCredentialCreatedEventData }

        variant :"vault_credential.archived", -> { Anthropic::Beta::BetaWebhookVaultCredentialArchivedEventData }

        variant :"vault_credential.deleted", -> { Anthropic::Beta::BetaWebhookVaultCredentialDeletedEventData }

        variant :"vault_credential.refresh_failed",
                -> { Anthropic::Beta::BetaWebhookVaultCredentialRefreshFailedEventData }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaWebhookSessionCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionPendingEventData, Anthropic::Models::Beta::BetaWebhookSessionRunningEventData, Anthropic::Models::Beta::BetaWebhookSessionIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionRequiresActionEventData, Anthropic::Models::Beta::BetaWebhookSessionArchivedEventData, Anthropic::Models::Beta::BetaWebhookSessionDeletedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRescheduledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRunStartedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData, Anthropic::Models::Beta::BetaWebhookVaultCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialRefreshFailedEventData)]
      end
    end

    BetaWebhookEventData = Beta::BetaWebhookEventData
  end
end
