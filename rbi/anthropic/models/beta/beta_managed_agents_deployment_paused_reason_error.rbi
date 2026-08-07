# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentPausedReasonError =
      Beta::BetaManagedAgentsDeploymentPausedReasonError

    module Beta
      # The error that triggered an auto-pause. Matches the failed run's `error.type`.
      module BetaManagedAgentsDeploymentPausedReasonError
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError,
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(type: T.any(Symbol, String)).returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError::Variants
          )
        end
        def self.new(type:)
        end
      end
    end
  end
end
