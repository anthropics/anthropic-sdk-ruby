# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :session_resource_not_found_error]
        required :type, const: :session_resource_not_found_error

        # @!method initialize(type: :session_resource_not_found_error)
        #   A referenced resource no longer exists and its kind was not reported.
        #
        #   @param type [Symbol, :session_resource_not_found_error]
      end
    end

    BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError
  end
end
