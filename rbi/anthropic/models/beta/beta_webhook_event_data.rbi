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
              Anthropic::Beta::BetaWebhookSessionStatusScheduledEventData,
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
              Anthropic::Beta::BetaWebhookVaultCredentialRefreshFailedEventData
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
