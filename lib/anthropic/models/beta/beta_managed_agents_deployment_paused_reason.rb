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
      end
    end

    BetaManagedAgentsDeploymentPausedReason = Beta::BetaManagedAgentsDeploymentPausedReason
  end
end
