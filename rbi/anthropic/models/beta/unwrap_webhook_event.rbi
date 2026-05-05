# typed: strong

module Anthropic
  module Models
    module Beta
      class UnwrapWebhookEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::UnwrapWebhookEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique event identifier for idempotency.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 timestamp when the event occurred.
        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(Anthropic::Beta::BetaWebhookEventData::Variants) }
        attr_accessor :data

        # Object type. Always `event` for webhook payloads.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created_at: Time,
            data:
              T.any(
                Anthropic::Beta::BetaWebhookSessionCreatedEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionPendingEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionRunningEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionIdledEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionRequiresActionEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionArchivedEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionDeletedEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionStatusScheduledEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionStatusRunStartedEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionStatusIdledEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionStatusTerminatedEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionThreadCreatedEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionThreadIdledEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionThreadTerminatedEventData::OrHash,
                Anthropic::Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData::OrHash,
                Anthropic::Beta::BetaWebhookVaultCreatedEventData::OrHash,
                Anthropic::Beta::BetaWebhookVaultArchivedEventData::OrHash,
                Anthropic::Beta::BetaWebhookVaultDeletedEventData::OrHash,
                Anthropic::Beta::BetaWebhookVaultCredentialCreatedEventData::OrHash,
                Anthropic::Beta::BetaWebhookVaultCredentialArchivedEventData::OrHash,
                Anthropic::Beta::BetaWebhookVaultCredentialDeletedEventData::OrHash,
                Anthropic::Beta::BetaWebhookVaultCredentialRefreshFailedEventData::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique event identifier for idempotency.
          id:,
          # RFC 3339 timestamp when the event occurred.
          created_at:,
          data:,
          # Object type. Always `event` for webhook payloads.
          type: :event
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              data: Anthropic::Beta::BetaWebhookEventData::Variants,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
