# frozen_string_literal: true

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError]
      required :error, union: -> { Anthropic::BetaError }

      # @!attribute type
      #
      #   @return [Symbol, :error]
      required :type, const: :error

      # @!method initialize(error:, type: :error)
      #   @param error [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError]
      #   @param type [Symbol, :error]
    end
  end
end
