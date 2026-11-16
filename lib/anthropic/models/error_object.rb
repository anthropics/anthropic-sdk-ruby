# frozen_string_literal: true

module Anthropic
  module Models
    module ErrorObject
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :invalid_request_error, -> { Anthropic::InvalidRequestErrorObject }

      variant :authentication_error, -> { Anthropic::AuthenticationErrorObject }

      variant :billing_error, -> { Anthropic::BillingErrorObject }

      variant :permission_error, -> { Anthropic::PermissionErrorObject }

      variant :not_found_error, -> { Anthropic::NotFoundErrorObject }

      variant :rate_limit_error, -> { Anthropic::RateLimitErrorObject }

      variant :timeout_error, -> { Anthropic::GatewayTimeoutErrorObject }

      variant :api_error, -> { Anthropic::APIErrorObject }

      variant :overloaded_error, -> { Anthropic::OverloadedErrorObject }

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
      #   @return [Array(Anthropic::Models::InvalidRequestErrorObject, Anthropic::Models::AuthenticationErrorObject, Anthropic::Models::BillingErrorObject, Anthropic::Models::PermissionErrorObject, Anthropic::Models::NotFoundErrorObject, Anthropic::Models::RateLimitErrorObject, Anthropic::Models::GatewayTimeoutErrorObject, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedErrorObject)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ErrorObject} for more details.
      #
      # @param type [Symbol, Anthropic::Models::ErrorObject::Type, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :message A human-readable explanation of the error. Its wording can change, so don't matc
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::InvalidRequestErrorObject, Anthropic::Models::AuthenticationErrorObject, Anthropic::Models::BillingErrorObject, Anthropic::Models::PermissionErrorObject, Anthropic::Models::NotFoundErrorObject, Anthropic::Models::RateLimitErrorObject, Anthropic::Models::GatewayTimeoutErrorObject, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedErrorObject]
      def self.new(type:, **args)
        case type.to_sym
        when :invalid_request_error
          Anthropic::InvalidRequestErrorObject.new(**args)
        when :authentication_error
          Anthropic::AuthenticationErrorObject.new(**args)
        when :billing_error
          Anthropic::BillingErrorObject.new(**args)
        when :permission_error
          Anthropic::PermissionErrorObject.new(**args)
        when :not_found_error
          Anthropic::NotFoundErrorObject.new(**args)
        when :rate_limit_error
          Anthropic::RateLimitErrorObject.new(**args)
        when :timeout_error
          Anthropic::GatewayTimeoutErrorObject.new(**args)
        when :api_error
          Anthropic::APIErrorObject.new(**args)
        when :overloaded_error
          Anthropic::OverloadedErrorObject.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
