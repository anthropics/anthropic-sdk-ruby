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

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaWebhookEventData::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_CREATED =
            T.let(
              :"session.created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_PENDING =
            T.let(
              :"session.pending",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_RUNNING =
            T.let(
              :"session.running",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_IDLED =
            T.let(
              :"session.idled",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_REQUIRES_ACTION =
            T.let(
              :"session.requires_action",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_ARCHIVED =
            T.let(
              :"session.archived",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_DELETED =
            T.let(
              :"session.deleted",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_STATUS_RESCHEDULED =
            T.let(
              :"session.status_rescheduled",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_STATUS_RUN_STARTED =
            T.let(
              :"session.status_run_started",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_STATUS_IDLED =
            T.let(
              :"session.status_idled",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_STATUS_TERMINATED =
            T.let(
              :"session.status_terminated",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_THREAD_CREATED =
            T.let(
              :"session.thread_created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_THREAD_IDLED =
            T.let(
              :"session.thread_idled",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_THREAD_TERMINATED =
            T.let(
              :"session.thread_terminated",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_OUTCOME_EVALUATION_ENDED =
            T.let(
              :"session.outcome_evaluation_ended",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          VAULT_CREATED =
            T.let(
              :"vault.created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          VAULT_ARCHIVED =
            T.let(
              :"vault.archived",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          VAULT_DELETED =
            T.let(
              :"vault.deleted",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          VAULT_CREDENTIAL_CREATED =
            T.let(
              :"vault_credential.created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          VAULT_CREDENTIAL_ARCHIVED =
            T.let(
              :"vault_credential.archived",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          VAULT_CREDENTIAL_DELETED =
            T.let(
              :"vault_credential.deleted",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          VAULT_CREDENTIAL_REFRESH_FAILED =
            T.let(
              :"vault_credential.refresh_failed",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_UPDATED =
            T.let(
              :"session.updated",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          AGENT_CREATED =
            T.let(
              :"agent.created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          AGENT_ARCHIVED =
            T.let(
              :"agent.archived",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          AGENT_DELETED =
            T.let(
              :"agent.deleted",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_PAUSED =
            T.let(
              :"deployment.paused",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_RUN_FAILED =
            T.let(
              :"deployment_run.failed",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_CREATED =
            T.let(
              :"deployment.created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_UPDATED =
            T.let(
              :"deployment.updated",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_UNPAUSED =
            T.let(
              :"deployment.unpaused",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          AGENT_UPDATED =
            T.let(
              :"agent.updated",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_ARCHIVED =
            T.let(
              :"deployment.archived",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_RUN_STARTED =
            T.let(
              :"deployment_run.started",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_DELETED =
            T.let(
              :"deployment.deleted",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          DEPLOYMENT_RUN_SUCCEEDED =
            T.let(
              :"deployment_run.succeeded",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          ENVIRONMENT_CREATED =
            T.let(
              :"environment.created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          ENVIRONMENT_UPDATED =
            T.let(
              :"environment.updated",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          ENVIRONMENT_ARCHIVED =
            T.let(
              :"environment.archived",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          ENVIRONMENT_DELETED =
            T.let(
              :"environment.deleted",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          MEMORY_STORE_CREATED =
            T.let(
              :"memory_store.created",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          MEMORY_STORE_ARCHIVED =
            T.let(
              :"memory_store.archived",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          MEMORY_STORE_DELETED =
            T.let(
              :"memory_store.deleted",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )
          SESSION_BUDGET_REACHED =
            T.let(
              :"session.budget_reached",
              Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebhookEventData::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
