# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaDreamingError
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

        # Returned with status 409 when a request to create a dream sets `output_behavior` to `update_existing` and another dream that writes into the same memory store hasn't fully stopped.
        #
        # The other dream is `pending` or `running`, or it has just stopped and is still finishing its last writes. `message` gives the ID of the other dream when the server can identify it. If that dream has already reached `completed`, `failed`, or `canceled`, retry after a short wait. Otherwise, wait for the other dream to end or cancel it, then retry. The response sets the `x-should-retry` header to `false`.
        variant :conflict_error, -> { Anthropic::Beta::BetaTargetStoreHeldError }

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
          CONFLICT_ERROR = :conflict_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::Beta::BetaTargetStoreHeldError)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaDreamingError} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaDreamingError::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :message A human-readable explanation of the error. Its wording can change, so don't matc
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::Beta::BetaTargetStoreHeldError]
        def self.new(type:, **args)
          case type.to_sym
          when :invalid_request_error
            Anthropic::BetaInvalidRequestError.new(**args)
          when :authentication_error
            Anthropic::BetaAuthenticationError.new(**args)
          when :billing_error
            Anthropic::BetaBillingError.new(**args)
          when :permission_error
            Anthropic::BetaPermissionError.new(**args)
          when :not_found_error
            Anthropic::BetaNotFoundError.new(**args)
          when :rate_limit_error
            Anthropic::BetaRateLimitError.new(**args)
          when :timeout_error
            Anthropic::BetaGatewayTimeoutError.new(**args)
          when :api_error
            Anthropic::BetaAPIError.new(**args)
          when :overloaded_error
            Anthropic::BetaOverloadedError.new(**args)
          when :conflict_error
            Anthropic::Beta::BetaTargetStoreHeldError.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaDreamingError = Beta::BetaDreamingError
  end
end
