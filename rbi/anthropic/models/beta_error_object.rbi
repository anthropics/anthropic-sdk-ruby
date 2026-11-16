# typed: strong

module Anthropic
  module Models
    module BetaErrorObject
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::BetaInvalidRequestErrorObject,
            Anthropic::BetaAuthenticationErrorObject,
            Anthropic::BetaBillingErrorObject,
            Anthropic::BetaPermissionErrorObject,
            Anthropic::BetaNotFoundErrorObject,
            Anthropic::BetaRateLimitErrorObject,
            Anthropic::BetaGatewayTimeoutErrorObject,
            Anthropic::BetaAPIErrorObject,
            Anthropic::BetaOverloadedErrorObject
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::BetaErrorObject::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVALID_REQUEST_ERROR =
          T.let(
            :invalid_request_error,
            Anthropic::BetaErrorObject::Type::TaggedSymbol
          )
        AUTHENTICATION_ERROR =
          T.let(
            :authentication_error,
            Anthropic::BetaErrorObject::Type::TaggedSymbol
          )
        BILLING_ERROR =
          T.let(:billing_error, Anthropic::BetaErrorObject::Type::TaggedSymbol)
        PERMISSION_ERROR =
          T.let(
            :permission_error,
            Anthropic::BetaErrorObject::Type::TaggedSymbol
          )
        NOT_FOUND_ERROR =
          T.let(
            :not_found_error,
            Anthropic::BetaErrorObject::Type::TaggedSymbol
          )
        RATE_LIMIT_ERROR =
          T.let(
            :rate_limit_error,
            Anthropic::BetaErrorObject::Type::TaggedSymbol
          )
        TIMEOUT_ERROR =
          T.let(:timeout_error, Anthropic::BetaErrorObject::Type::TaggedSymbol)
        API_ERROR =
          T.let(:api_error, Anthropic::BetaErrorObject::Type::TaggedSymbol)
        OVERLOADED_ERROR =
          T.let(
            :overloaded_error,
            Anthropic::BetaErrorObject::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::BetaErrorObject::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig { override.returns(T::Array[Anthropic::BetaErrorObject::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: Anthropic::BetaErrorObject::Type::OrSymbol,
          message: String
        ).returns(Anthropic::BetaErrorObject::Variants)
      end
      def self.new(
        type:,
        # A human-readable explanation of the error. Its wording can change, so don't
        # match on it.
        message:
      )
      end
    end
  end
end
