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

        variant :"session.updated", -> { Anthropic::Beta::BetaWebhookSessionUpdatedEventData }

        variant :"agent.created", -> { Anthropic::Beta::BetaWebhookAgentCreatedEventData }

        variant :"agent.archived", -> { Anthropic::Beta::BetaWebhookAgentArchivedEventData }

        variant :"agent.deleted", -> { Anthropic::Beta::BetaWebhookAgentDeletedEventData }

        variant :"deployment.paused", -> { Anthropic::Beta::BetaWebhookDeploymentPausedEventData }

        variant :"deployment_run.failed", -> { Anthropic::Beta::BetaWebhookDeploymentRunFailedEventData }

        variant :"deployment.created", -> { Anthropic::Beta::BetaWebhookDeploymentCreatedEventData }

        variant :"deployment.updated", -> { Anthropic::Beta::BetaWebhookDeploymentUpdatedEventData }

        variant :"deployment.unpaused", -> { Anthropic::Beta::BetaWebhookDeploymentUnpausedEventData }

        variant :"agent.updated", -> { Anthropic::Beta::BetaWebhookAgentUpdatedEventData }

        variant :"deployment.archived", -> { Anthropic::Beta::BetaWebhookDeploymentArchivedEventData }

        variant :"deployment_run.started", -> { Anthropic::Beta::BetaWebhookDeploymentRunStartedEventData }

        variant :"deployment.deleted", -> { Anthropic::Beta::BetaWebhookDeploymentDeletedEventData }

        variant :"deployment_run.succeeded", -> { Anthropic::Beta::BetaWebhookDeploymentRunSucceededEventData }

        variant :"environment.created", -> { Anthropic::Beta::BetaWebhookEnvironmentCreatedEventData }

        variant :"environment.updated", -> { Anthropic::Beta::BetaWebhookEnvironmentUpdatedEventData }

        variant :"environment.archived", -> { Anthropic::Beta::BetaWebhookEnvironmentArchivedEventData }

        variant :"environment.deleted", -> { Anthropic::Beta::BetaWebhookEnvironmentDeletedEventData }

        variant :"memory_store.created", -> { Anthropic::Beta::BetaWebhookMemoryStoreCreatedEventData }

        variant :"memory_store.archived", -> { Anthropic::Beta::BetaWebhookMemoryStoreArchivedEventData }

        variant :"memory_store.deleted", -> { Anthropic::Beta::BetaWebhookMemoryStoreDeletedEventData }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaWebhookSessionCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionPendingEventData, Anthropic::Models::Beta::BetaWebhookSessionRunningEventData, Anthropic::Models::Beta::BetaWebhookSessionIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionRequiresActionEventData, Anthropic::Models::Beta::BetaWebhookSessionArchivedEventData, Anthropic::Models::Beta::BetaWebhookSessionDeletedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRescheduledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusRunStartedEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionStatusTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadCreatedEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadIdledEventData, Anthropic::Models::Beta::BetaWebhookSessionThreadTerminatedEventData, Anthropic::Models::Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData, Anthropic::Models::Beta::BetaWebhookVaultCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialCreatedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialArchivedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialDeletedEventData, Anthropic::Models::Beta::BetaWebhookVaultCredentialRefreshFailedEventData, Anthropic::Models::Beta::BetaWebhookSessionUpdatedEventData, Anthropic::Models::Beta::BetaWebhookAgentCreatedEventData, Anthropic::Models::Beta::BetaWebhookAgentArchivedEventData, Anthropic::Models::Beta::BetaWebhookAgentDeletedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentPausedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentRunFailedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentCreatedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentUpdatedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentUnpausedEventData, Anthropic::Models::Beta::BetaWebhookAgentUpdatedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentArchivedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentRunStartedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentDeletedEventData, Anthropic::Models::Beta::BetaWebhookDeploymentRunSucceededEventData, Anthropic::Models::Beta::BetaWebhookEnvironmentCreatedEventData, Anthropic::Models::Beta::BetaWebhookEnvironmentUpdatedEventData, Anthropic::Models::Beta::BetaWebhookEnvironmentArchivedEventData, Anthropic::Models::Beta::BetaWebhookEnvironmentDeletedEventData, Anthropic::Models::Beta::BetaWebhookMemoryStoreCreatedEventData, Anthropic::Models::Beta::BetaWebhookMemoryStoreArchivedEventData, Anthropic::Models::Beta::BetaWebhookMemoryStoreDeletedEventData)]
      end
    end

    BetaWebhookEventData = Beta::BetaWebhookEventData
  end
end
