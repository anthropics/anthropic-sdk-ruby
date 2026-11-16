# frozen_string_literal: true

module Anthropic
  module Models
    module BetaErrorObject
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :invalid_request_error, -> { Anthropic::BetaInvalidRequestErrorObject }

      variant :authentication_error, -> { Anthropic::BetaAuthenticationErrorObject }

      variant :billing_error, -> { Anthropic::BetaBillingErrorObject }

      variant :permission_error, -> { Anthropic::BetaPermissionErrorObject }

      variant :not_found_error, -> { Anthropic::BetaNotFoundErrorObject }

      variant :rate_limit_error, -> { Anthropic::BetaRateLimitErrorObject }

      variant :timeout_error, -> { Anthropic::BetaGatewayTimeoutErrorObject }

      variant :api_error, -> { Anthropic::BetaAPIErrorObject }

      variant :overloaded_error, -> { Anthropic::BetaOverloadedErrorObject }

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
      #   @return [Array(Anthropic::Models::BetaInvalidRequestErrorObject, Anthropic::Models::BetaAuthenticationErrorObject, Anthropic::Models::BetaBillingErrorObject, Anthropic::Models::BetaPermissionErrorObject, Anthropic::Models::BetaNotFoundErrorObject, Anthropic::Models::BetaRateLimitErrorObject, Anthropic::Models::BetaGatewayTimeoutErrorObject, Anthropic::Models::BetaAPIErrorObject, Anthropic::Models::BetaOverloadedErrorObject)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::BetaErrorObject} for more details.
      #
      # @param type [Symbol, Anthropic::Models::BetaErrorObject::Type, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :message A human-readable explanation of the error. Its wording can change, so don't matc
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::BetaInvalidRequestErrorObject, Anthropic::Models::BetaAuthenticationErrorObject, Anthropic::Models::BetaBillingErrorObject, Anthropic::Models::BetaPermissionErrorObject, Anthropic::Models::BetaNotFoundErrorObject, Anthropic::Models::BetaRateLimitErrorObject, Anthropic::Models::BetaGatewayTimeoutErrorObject, Anthropic::Models::BetaAPIErrorObject, Anthropic::Models::BetaOverloadedErrorObject]
      def self.new(type:, **args)
        case type.to_sym
        when :invalid_request_error
          Anthropic::BetaInvalidRequestErrorObject.new(**args)
        when :authentication_error
          Anthropic::BetaAuthenticationErrorObject.new(**args)
        when :billing_error
          Anthropic::BetaBillingErrorObject.new(**args)
        when :permission_error
          Anthropic::BetaPermissionErrorObject.new(**args)
        when :not_found_error
          Anthropic::BetaNotFoundErrorObject.new(**args)
        when :rate_limit_error
          Anthropic::BetaRateLimitErrorObject.new(**args)
        when :timeout_error
          Anthropic::BetaGatewayTimeoutErrorObject.new(**args)
        when :api_error
          Anthropic::BetaAPIErrorObject.new(**args)
        when :overloaded_error
          Anthropic::BetaOverloadedErrorObject.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
