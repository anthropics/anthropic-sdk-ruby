# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsErrorDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        # @!attribute error
        #   The failed run's error.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject]
        required :error, union: -> { Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject }

        # @!attribute type
        #
        #   @return [Symbol, :error]
        required :type, const: :error

        # @!method initialize(error:, type: :error)
        #   A scheduled fire recorded a failed run whose error auto-pauses the deployment.
        #
        #   @param error [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject] The failed run's error.
        #
        #   @param type [Symbol, :error]
      end
    end

    BetaManagedAgentsErrorDeploymentPausedReason = Beta::BetaManagedAgentsErrorDeploymentPausedReason
  end
end
