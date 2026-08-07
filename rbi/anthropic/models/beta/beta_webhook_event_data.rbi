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
              Anthropic::Beta::BetaWebhookMemoryStoreDeletedEventData,
              Anthropic::Beta::BetaWebhookSessionBudgetReachedEventData
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaWebhookEventData::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            id: String,
            organization_id: String,
            workspace_id: String,
            session_thread_id: String,
            vault_id: String
          ).returns(Anthropic::Beta::BetaWebhookEventData::Variants)
        end
        def self.new(
          type:,
          # ID of the session that triggered the event.
          id:,
          organization_id:,
          workspace_id:,
          # ID of the session thread this event refers to.
          session_thread_id: nil,
          # ID of the vault that owns this credential.
          vault_id: nil
        )
        end
      end
    end
  end
end
