# typed: strong

module Anthropic
  module Models
    module BetaError
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
            Anthropic::BetaOverloadedError
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::BetaError::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVALID_REQUEST_ERROR =
          T.let(
            :invalid_request_error,
            Anthropic::BetaError::Type::TaggedSymbol
          )
        AUTHENTICATION_ERROR =
          T.let(:authentication_error, Anthropic::BetaError::Type::TaggedSymbol)
        BILLING_ERROR =
          T.let(:billing_error, Anthropic::BetaError::Type::TaggedSymbol)
        PERMISSION_ERROR =
          T.let(:permission_error, Anthropic::BetaError::Type::TaggedSymbol)
        NOT_FOUND_ERROR =
          T.let(:not_found_error, Anthropic::BetaError::Type::TaggedSymbol)
        RATE_LIMIT_ERROR =
          T.let(:rate_limit_error, Anthropic::BetaError::Type::TaggedSymbol)
        TIMEOUT_ERROR =
          T.let(:timeout_error, Anthropic::BetaError::Type::TaggedSymbol)
        API_ERROR = T.let(:api_error, Anthropic::BetaError::Type::TaggedSymbol)
        OVERLOADED_ERROR =
          T.let(:overloaded_error, Anthropic::BetaError::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Anthropic::BetaError::Type::TaggedSymbol])
        end
        def self.values
        end
      end

      sig { override.returns(T::Array[Anthropic::BetaError::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(type: T.any(Symbol, String), message: String).returns(
          Anthropic::BetaError::Variants
        )
      end
      def self.new(type:, message:)
      end
    end
  end
end
