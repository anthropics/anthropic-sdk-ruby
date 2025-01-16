# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # case beta_error
    # in {type: "invalid_request_error", message: String, type: enum: Anthropic::Models::BetaInvalidRequestError::Type}
    #   # Anthropic::Models::BetaInvalidRequestError ...
    # in {type: "authentication_error", message: String, type: enum: Anthropic::Models::BetaAuthenticationError::Type}
    #   # Anthropic::Models::BetaAuthenticationError ...
    # in {type: "billing_error", message: String, type: enum: Anthropic::Models::BetaBillingError::Type}
    #   # Anthropic::Models::BetaBillingError ...
    # in {type: "permission_error", message: String, type: enum: Anthropic::Models::BetaPermissionError::Type}
    #   # Anthropic::Models::BetaPermissionError ...
    # in {type: "not_found_error", message: String, type: enum: Anthropic::Models::BetaNotFoundError::Type}
    #   # Anthropic::Models::BetaNotFoundError ...
    # in {type: "rate_limit_error", message: String, type: enum: Anthropic::Models::BetaRateLimitError::Type}
    #   # Anthropic::Models::BetaRateLimitError ...
    # in {type: "timeout_error", message: String, type: enum: Anthropic::Models::BetaGatewayTimeoutError::Type}
    #   # Anthropic::Models::BetaGatewayTimeoutError ...
    # in {type: "api_error", message: String, type: enum: Anthropic::Models::BetaAPIError::Type}
    #   # Anthropic::Models::BetaAPIError ...
    # in {type: "overloaded_error", message: String, type: enum: Anthropic::Models::BetaOverloadedError::Type}
    #   # Anthropic::Models::BetaOverloadedError ...
    # end
    # ```
    #
    # @example
    # ```ruby
    # case beta_error
    # in Anthropic::Models::BetaInvalidRequestError
    #   # ...
    # in Anthropic::Models::BetaAuthenticationError
    #   # ...
    # in Anthropic::Models::BetaBillingError
    #   # ...
    # in Anthropic::Models::BetaPermissionError
    #   # ...
    # in Anthropic::Models::BetaNotFoundError
    #   # ...
    # in Anthropic::Models::BetaRateLimitError
    #   # ...
    # in Anthropic::Models::BetaGatewayTimeoutError
    #   # ...
    # in Anthropic::Models::BetaAPIError
    #   # ...
    # in Anthropic::Models::BetaOverloadedError
    #   # ...
    # end
    # ```
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
