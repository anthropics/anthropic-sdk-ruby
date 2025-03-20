# typed: strong

module Anthropic
  module Models
    module BetaError
      extend Anthropic::Union

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
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
          }
        end
    end
  end
end
