# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Lifecycle status of a deployment.
      module BetaManagedAgentsDeploymentStatus
        extend Anthropic::Internal::Type::Enum

        ACTIVE = :active
        PAUSED = :paused

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaManagedAgentsDeploymentStatus = Beta::BetaManagedAgentsDeploymentStatus
  end
end
