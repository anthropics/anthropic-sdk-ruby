# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case union
    # in Anthropic::Models::InvalidRequestError
    #   # ...
    # in Anthropic::Models::AuthenticationError_
    #   # ...
    # in Anthropic::Models::BillingError
    #   # ...
    # in Anthropic::Models::PermissionError
    #   # ...
    # in Anthropic::Models::NotFoundError_
    #   # ...
    # in Anthropic::Models::RateLimitError_
    #   # ...
    # in Anthropic::Models::GatewayTimeoutError
    #   # ...
    # in Anthropic::Models::APIErrorObject
    #   # ...
    # in Anthropic::Models::OverloadedError
    #   # ...
    # end
    # ```
    class ErrorObject < Anthropic::Union
      discriminator :type

      variant :invalid_request_error, -> { Anthropic::Models::InvalidRequestError }

      variant :authentication_error, -> { Anthropic::Models::AuthenticationError_ }

      variant :billing_error, -> { Anthropic::Models::BillingError }

      variant :permission_error, -> { Anthropic::Models::PermissionError }

      variant :not_found_error, -> { Anthropic::Models::NotFoundError_ }

      variant :rate_limit_error, -> { Anthropic::Models::RateLimitError_ }

      variant :timeout_error, -> { Anthropic::Models::GatewayTimeoutError }

      variant :api_error, -> { Anthropic::Models::APIErrorObject }

      variant :overloaded_error, -> { Anthropic::Models::OverloadedError }
    end
  end
end
