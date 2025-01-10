# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case error_object
    # in {type: "invalid_request_error", message: String, type: Anthropic::Models::InvalidRequestError::Type}
    #   # Anthropic::Models::InvalidRequestError ...
    # in {type: "authentication_error", message: String, type: Anthropic::Models::AuthenticationError_::Type}
    #   # Anthropic::Models::AuthenticationError_ ...
    # in {type: "billing_error", message: String, type: Anthropic::Models::BillingError::Type}
    #   # Anthropic::Models::BillingError ...
    # in {type: "permission_error", message: String, type: Anthropic::Models::PermissionError::Type}
    #   # Anthropic::Models::PermissionError ...
    # in {type: "not_found_error", message: String, type: Anthropic::Models::NotFoundError_::Type}
    #   # Anthropic::Models::NotFoundError_ ...
    # in {type: "rate_limit_error", message: String, type: Anthropic::Models::RateLimitError_::Type}
    #   # Anthropic::Models::RateLimitError_ ...
    # in {type: "timeout_error", message: String, type: Anthropic::Models::GatewayTimeoutError::Type}
    #   # Anthropic::Models::GatewayTimeoutError ...
    # in {type: "api_error", message: String, type: Anthropic::Models::APIErrorObject::Type}
    #   # Anthropic::Models::APIErrorObject ...
    # in {type: "overloaded_error", message: String, type: Anthropic::Models::OverloadedError::Type}
    #   # Anthropic::Models::OverloadedError ...
    # end
    # ```
    #
    # @example
    #
    # ```ruby
    # case error_object
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
