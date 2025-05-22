# frozen_string_literal: true

module Anthropic
  module Models
    module ErrorObject
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :invalid_request_error, -> { Anthropic::InvalidRequestError }

      variant :authentication_error, -> { Anthropic::AuthenticationError }

      variant :billing_error, -> { Anthropic::BillingError }

      variant :permission_error, -> { Anthropic::PermissionError }

      variant :not_found_error, -> { Anthropic::NotFoundError }

      variant :rate_limit_error, -> { Anthropic::RateLimitError }

      variant :timeout_error, -> { Anthropic::GatewayTimeoutError }

      variant :api_error, -> { Anthropic::APIErrorObject }

      variant :overloaded_error, -> { Anthropic::OverloadedError }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError)]
    end
  end
end
