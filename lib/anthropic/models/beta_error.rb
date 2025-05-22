# frozen_string_literal: true

module Anthropic
  module Models
    module BetaError
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :invalid_request_error, -> { Anthropic::BetaInvalidRequestError }

      variant :authentication_error, -> { Anthropic::BetaAuthenticationError }

      variant :billing_error, -> { Anthropic::BetaBillingError }

      variant :permission_error, -> { Anthropic::BetaPermissionError }

      variant :not_found_error, -> { Anthropic::BetaNotFoundError }

      variant :rate_limit_error, -> { Anthropic::BetaRateLimitError }

      variant :timeout_error, -> { Anthropic::BetaGatewayTimeoutError }

      variant :api_error, -> { Anthropic::BetaAPIError }

      variant :overloaded_error, -> { Anthropic::BetaOverloadedError }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError)]
    end
  end
end
