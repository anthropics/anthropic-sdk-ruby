# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   The deployment's environment no longer exists.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ENVIRONMENT_NOT_FOUND_ERROR = :environment_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError
  end
end
