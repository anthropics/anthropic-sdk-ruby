# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   A referenced resource no longer exists and its kind was not reported.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION_RESOURCE_NOT_FOUND_ERROR = :session_resource_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError
  end
end
