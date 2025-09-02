# frozen_string_literal: true

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError]
      required :error, union: -> { Anthropic::BetaError }

      # @!attribute request_id
      #
      #   @return [String, nil]
      required :request_id, String, nil?: true

      # @!attribute type
      #
      #   @return [Symbol, :error]
      required :type, const: :error

      # @!method initialize(error:, request_id:, type: :error)
      #   @param error [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError]
      #   @param request_id [String, nil]
      #   @param type [Symbol, :error]
    end
  end
end
