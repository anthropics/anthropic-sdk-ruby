# typed: strong

module Anthropic
  module Models
    BetaWebhookEventData = Beta::BetaWebhookEventData

    module Beta
      module BetaWebhookEventData
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookSessionCreatedEventData,
              Anthropic::Beta::BetaWebhookSessionPendingEventData,
              Anthropic::Beta::BetaWebhookSessionRunningEventData,
              Anthropic::Beta::BetaWebhookSessionIdledEventData,
              Anthropic::Beta::BetaWebhookSessionRequiresActionEventData,
              Anthropic::Beta::BetaWebhookSessionArchivedEventData,
              Anthropic::Beta::BetaWebhookSessionDeletedEventData,
              Anthropic::Beta::BetaWebhookSessionStatusRescheduledEventData,
              Anthropic::Beta::BetaWebhookSessionStatusRunStartedEventData,
              Anthropic::Beta::BetaWebhookSessionStatusIdledEventData,
              Anthropic::Beta::BetaWebhookSessionStatusTerminatedEventData,
              Anthropic::Beta::BetaWebhookSessionThreadCreatedEventData,
              Anthropic::Beta::BetaWebhookSessionThreadIdledEventData,
              Anthropic::Beta::BetaWebhookSessionThreadTerminatedEventData,
              Anthropic::Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData,
              Anthropic::Beta::BetaWebhookVaultCreatedEventData,
              Anthropic::Beta::BetaWebhookVaultArchivedEventData,
              Anthropic::Beta::BetaWebhookVaultDeletedEventData,
              Anthropic::Beta::BetaWebhookVaultCredentialCreatedEventData,
              Anthropic::Beta::BetaWebhookVaultCredentialArchivedEventData,
              Anthropic::Beta::BetaWebhookVaultCredentialDeletedEventData,
              Anthropic::Beta::BetaWebhookVaultCredentialRefreshFailedEventData,
              Anthropic::Beta::BetaWebhookSessionUpdatedEventData,
              Anthropic::Beta::BetaWebhookAgentCreatedEventData,
              Anthropic::Beta::BetaWebhookAgentArchivedEventData,
              Anthropic::Beta::BetaWebhookAgentDeletedEventData,
              Anthropic::Beta::BetaWebhookDeploymentPausedEventData,
              Anthropic::Beta::BetaWebhookDeploymentRunFailedEventData,
              Anthropic::Beta::BetaWebhookDeploymentCreatedEventData,
              Anthropic::Beta::BetaWebhookDeploymentUpdatedEventData,
              Anthropic::Beta::BetaWebhookDeploymentUnpausedEventData,
              Anthropic::Beta::BetaWebhookAgentUpdatedEventData,
              Anthropic::Beta::BetaWebhookDeploymentArchivedEventData,
              Anthropic::Beta::BetaWebhookDeploymentRunStartedEventData,
              Anthropic::Beta::BetaWebhookDeploymentDeletedEventData,
              Anthropic::Beta::BetaWebhookDeploymentRunSucceededEventData,
              Anthropic::Beta::BetaWebhookEnvironmentCreatedEventData,
              Anthropic::Beta::BetaWebhookEnvironmentUpdatedEventData,
              Anthropic::Beta::BetaWebhookEnvironmentArchivedEventData,
              Anthropic::Beta::BetaWebhookEnvironmentDeletedEventData,
              Anthropic::Beta::BetaWebhookMemoryStoreCreatedEventData,
              Anthropic::Beta::BetaWebhookMemoryStoreArchivedEventData,
              Anthropic::Beta::BetaWebhookMemoryStoreDeletedEventData
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaWebhookEventData::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
