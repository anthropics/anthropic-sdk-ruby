# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentPausedReason =
      Beta::BetaManagedAgentsDeploymentPausedReason

    module Beta
      # Why a deployment is paused. Non-null exactly when `status` is `paused`.
      module BetaManagedAgentsDeploymentPausedReason
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason,
              Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            error:
              T.any(
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::OrHash
              )
          ).returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Variants
          )
        end
        def self.new(
          type:,
          # The error that triggered an auto-pause. Matches the failed run's `error.type`.
          error: nil
        )
        end
      end
    end
  end
end
