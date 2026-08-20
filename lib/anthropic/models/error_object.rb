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

      module Type
        extend Anthropic::Internal::Type::Enum

        INVALID_REQUEST_ERROR = :invalid_request_error
        AUTHENTICATION_ERROR = :authentication_error
        BILLING_ERROR = :billing_error
        PERMISSION_ERROR = :permission_error
        NOT_FOUND_ERROR = :not_found_error
        RATE_LIMIT_ERROR = :rate_limit_error
        TIMEOUT_ERROR = :timeout_error
        API_ERROR = :api_error
        OVERLOADED_ERROR = :overloaded_error

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :message
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
      def self.new(type:, **args)
        case type.to_sym
        when :invalid_request_error
          Anthropic::InvalidRequestError.new(**args)
        when :authentication_error
          Anthropic::AuthenticationError.new(**args)
        when :billing_error
          Anthropic::BillingError.new(**args)
        when :permission_error
          Anthropic::PermissionError.new(**args)
        when :not_found_error
          Anthropic::NotFoundError.new(**args)
        when :rate_limit_error
          Anthropic::RateLimitError.new(**args)
        when :timeout_error
          Anthropic::GatewayTimeoutError.new(**args)
        when :api_error
          Anthropic::APIErrorObject.new(**args)
        when :overloaded_error
          Anthropic::OverloadedError.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
