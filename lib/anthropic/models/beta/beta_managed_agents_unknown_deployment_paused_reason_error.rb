# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsUnknownDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   An unrecognized error auto-paused the deployment. A fallback variant; matches a
        #   run whose `error.type` is `unknown_error`.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          UNKNOWN_ERROR = :unknown_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsUnknownDeploymentPausedReasonError =
      Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError
  end
end
