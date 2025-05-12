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
      #   @return [Array(Anthropic::BetaInvalidRequestError, Anthropic::BetaAuthenticationError, Anthropic::BetaBillingError, Anthropic::BetaPermissionError, Anthropic::BetaNotFoundError, Anthropic::BetaRateLimitError, Anthropic::BetaGatewayTimeoutError, Anthropic::BetaAPIError, Anthropic::BetaOverloadedError)]

      define_sorbet_constant!(:Variants) do
        T.type_alias do
          T.any(
            Anthropic::BetaInvalidRequestError,
            Anthropic::BetaAuthenticationError,
            Anthropic::BetaBillingError,
            Anthropic::BetaPermissionError,
            Anthropic::BetaNotFoundError,
            Anthropic::BetaRateLimitError,
            Anthropic::BetaGatewayTimeoutError,
            Anthropic::BetaAPIError,
            Anthropic::BetaOverloadedError
          )
        end
      end
    end
  end
end
