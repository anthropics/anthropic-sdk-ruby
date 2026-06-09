# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsManualDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type }

        # @!method initialize(type:)
        #   The caller invoked the pause endpoint on the deployment.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsManualDeploymentPausedReason#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MANUAL = :manual

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsManualDeploymentPausedReason = Beta::BetaManagedAgentsManualDeploymentPausedReason
  end
end
