# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsManualDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :manual]
        required :type, const: :manual

        # @!method initialize(type: :manual)
        #   The caller invoked the pause endpoint on the deployment.
        #
        #   @param type [Symbol, :manual]
      end
    end

    BetaManagedAgentsManualDeploymentPausedReason = Beta::BetaManagedAgentsManualDeploymentPausedReason
  end
end
