# typed: strong

module Anthropic
  module Models
    class BetaError < Anthropic::Union
      abstract!

      Variants = T.type_alias do
        T.any(
          Anthropic::Models::BetaInvalidRequestError,
          Anthropic::Models::BetaAuthenticationError,
          Anthropic::Models::BetaBillingError,
          Anthropic::Models::BetaPermissionError,
          Anthropic::Models::BetaNotFoundError,
          Anthropic::Models::BetaRateLimitError,
          Anthropic::Models::BetaGatewayTimeoutError,
          Anthropic::Models::BetaAPIError,
          Anthropic::Models::BetaOverloadedError
        )
      end

      sig do
        returns(
          [
            [Symbol, Anthropic::Models::BetaInvalidRequestError],
            [Symbol, Anthropic::Models::BetaAuthenticationError],
            [Symbol, Anthropic::Models::BetaBillingError],
            [Symbol, Anthropic::Models::BetaPermissionError],
            [Symbol, Anthropic::Models::BetaNotFoundError],
            [Symbol, Anthropic::Models::BetaRateLimitError],
            [Symbol, Anthropic::Models::BetaGatewayTimeoutError],
            [Symbol, Anthropic::Models::BetaAPIError],
            [Symbol, Anthropic::Models::BetaOverloadedError]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
