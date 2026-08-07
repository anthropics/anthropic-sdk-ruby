# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Why a deployment is paused. Non-null exactly when `status` is `paused`.
      module BetaManagedAgentsDeploymentPausedReason
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The caller invoked the pause endpoint on the deployment.
        variant :manual, -> { Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason }

        # A scheduled fire recorded a failed run whose error auto-pauses the deployment.
        variant :error, -> { Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsManualDeploymentPausedReason, Anthropic::Models::Beta::BetaManagedAgentsErrorDeploymentPausedReason)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError] :error The error that triggered an auto-pause. Matches the failed run's `error.type`.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsManualDeploymentPausedReason, Anthropic::Models::Beta::BetaManagedAgentsErrorDeploymentPausedReason]
        def self.new(type:, **args)
          case type.to_sym
          when :manual
            Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason.new(**args)
          when :error
            Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsDeploymentPausedReason = Beta::BetaManagedAgentsDeploymentPausedReason
  end
end
