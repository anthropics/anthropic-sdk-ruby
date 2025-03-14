# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    class BetaError < Anthropic::Union
      discriminator :type

      variant :invalid_request_error, -> { Anthropic::Models::BetaInvalidRequestError }

      variant :authentication_error, -> { Anthropic::Models::BetaAuthenticationError }

      variant :billing_error, -> { Anthropic::Models::BetaBillingError }

      variant :permission_error, -> { Anthropic::Models::BetaPermissionError }

      variant :not_found_error, -> { Anthropic::Models::BetaNotFoundError }

      variant :rate_limit_error, -> { Anthropic::Models::BetaRateLimitError }

      variant :timeout_error, -> { Anthropic::Models::BetaGatewayTimeoutError }

      variant :api_error, -> { Anthropic::Models::BetaAPIError }

      variant :overloaded_error, -> { Anthropic::Models::BetaOverloadedError }
    end
  end
end
