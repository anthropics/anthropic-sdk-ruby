# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsUnknownDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :unknown_error]
        required :type, const: :unknown_error

        # @!method initialize(type: :unknown_error)
        #   An unrecognized error auto-paused the deployment. A fallback variant; matches a
        #   run whose `error.type` is `unknown_error`.
        #
        #   @param type [Symbol, :unknown_error]
      end
    end

    BetaManagedAgentsUnknownDeploymentPausedReasonError =
      Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError
  end
end
