# typed: strong

module Anthropic
  module Models
    BetaDreamingError = Beta::BetaDreamingError

    module Beta
      module BetaDreamingError
        extend Anthropic::Internal::Type::Union

        Variants =
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
              Anthropic::BetaOverloadedError,
              Anthropic::Beta::BetaTargetStoreHeldError
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDreamingError::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_REQUEST_ERROR =
            T.let(
              :invalid_request_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          AUTHENTICATION_ERROR =
            T.let(
              :authentication_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          BILLING_ERROR =
            T.let(
              :billing_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          PERMISSION_ERROR =
            T.let(
              :permission_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          NOT_FOUND_ERROR =
            T.let(
              :not_found_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          RATE_LIMIT_ERROR =
            T.let(
              :rate_limit_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          TIMEOUT_ERROR =
            T.let(
              :timeout_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          API_ERROR =
            T.let(
              :api_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          OVERLOADED_ERROR =
            T.let(
              :overloaded_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )
          CONFLICT_ERROR =
            T.let(
              :conflict_error,
              Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaDreamingError::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaDreamingError::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaDreamingError::Type::OrSymbol,
            message: String
          ).returns(Anthropic::Beta::BetaDreamingError::Variants)
        end
        def self.new(
          type:,
          # Human-readable description of the conflict, naming the dream that holds the
          # target store when the server can identify it.
          message: nil
        )
        end
      end
    end
  end
end
