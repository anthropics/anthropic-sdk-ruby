# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsErrorDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        # @!attribute error
        #   The failed run's error.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError]
        required :error, union: -> { Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError }

        # @!attribute type
        #
        #   @return [Symbol, :error]
        required :type, const: :error

        # @!method initialize(error:, type: :error)
        #   A scheduled fire recorded a failed run whose error auto-pauses the deployment.
        #
        #   @param error [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError] The failed run's error.
        #
        #   @param type [Symbol, :error]
      end
    end

    BetaManagedAgentsErrorDeploymentPausedReason = Beta::BetaManagedAgentsErrorDeploymentPausedReason
  end
end
