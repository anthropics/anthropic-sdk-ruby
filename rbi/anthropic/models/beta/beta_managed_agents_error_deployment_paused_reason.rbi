# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsErrorDeploymentPausedReason =
      Beta::BetaManagedAgentsErrorDeploymentPausedReason

    module Beta
      class BetaManagedAgentsErrorDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason,
              Anthropic::Internal::AnyHash
            )
          end

        # The failed run's error.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError::Variants
          )
        end
        attr_accessor :error

        sig { returns(Symbol) }
        attr_accessor :type

        # A scheduled fire recorded a failed run whose error auto-pauses the deployment.
        sig do
          params(
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
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The failed run's error.
          error:,
          type: :error
        )
        end

        sig do
          override.returns(
            {
              error:
                Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError::Variants,
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
