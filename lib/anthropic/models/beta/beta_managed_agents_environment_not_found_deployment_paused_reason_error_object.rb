# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :environment_not_found_error]
        required :type, const: :environment_not_found_error

        # @!method initialize(type: :environment_not_found_error)
        #   The deployment's environment no longer exists.
        #
        #   @param type [Symbol, :environment_not_found_error]
      end
    end

    BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject
  end
end
