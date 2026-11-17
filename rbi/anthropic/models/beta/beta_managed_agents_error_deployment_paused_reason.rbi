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
            Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Variants
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
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject::OrHash
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
                Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Variants,
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
