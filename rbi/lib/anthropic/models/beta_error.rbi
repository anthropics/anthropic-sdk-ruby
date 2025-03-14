# typed: strong

module Anthropic
  module Models
    class BetaError < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError]
            )
        end
        def variants
        end
      end
    end
  end
end
