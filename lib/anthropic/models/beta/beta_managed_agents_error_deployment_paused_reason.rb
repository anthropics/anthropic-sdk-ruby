# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsErrorDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        # @!attribute error
        #   The error that triggered an auto-pause. Matches the failed run's `error.type`.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError]
        required :error, union: -> { Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type }

        # @!method initialize(error:, type:)
        #   A scheduled fire recorded a failed run whose error auto-pauses the deployment.
        #
        #   @param error [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError] The error that triggered an auto-pause. Matches the failed run's `error.type`.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsErrorDeploymentPausedReason#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ERROR = :error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsErrorDeploymentPausedReason = Beta::BetaManagedAgentsErrorDeploymentPausedReason
  end
end
