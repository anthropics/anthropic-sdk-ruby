# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Lifecycle status of a deployment.
      module BetaManagedAgentsDeploymentStatus
        extend Anthropic::Internal::Type::Enum

        # The deployment is active and can run sessions. Archived deployments also report this status; check `archived_at` to distinguish them.
        ACTIVE = :active

        # The deployment is paused. Autonomous triggers are suppressed; manual runs are still permitted.
        PAUSED = :paused

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaManagedAgentsDeploymentStatus = Beta::BetaManagedAgentsDeploymentStatus
  end
end
