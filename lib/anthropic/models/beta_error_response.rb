# frozen_string_literal: true

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::BetaInvalidRequestError, Anthropic::BetaAuthenticationError, Anthropic::BetaBillingError, Anthropic::BetaPermissionError, Anthropic::BetaNotFoundError, Anthropic::BetaRateLimitError, Anthropic::BetaGatewayTimeoutError, Anthropic::BetaAPIError, Anthropic::BetaOverloadedError]
      required :error, union: -> { Anthropic::BetaError }

      # @!attribute type
      #
      #   @return [Symbol, :error]
      required :type, const: :error

      # @!method initialize(error:, type: :error)
      #   @param error [Anthropic::BetaInvalidRequestError, Anthropic::BetaAuthenticationError, Anthropic::BetaBillingError, Anthropic::BetaPermissionError, Anthropic::BetaNotFoundError, Anthropic::BetaRateLimitError, Anthropic::BetaGatewayTimeoutError, Anthropic::BetaAPIError, Anthropic::BetaOverloadedError]
      #   @param type [Symbol, :error]
    end
  end
end
