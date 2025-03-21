# typed: strong

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::BetaInvalidRequestError,
            Anthropic::Models::BetaAuthenticationError,
            Anthropic::Models::BetaBillingError,
            Anthropic::Models::BetaPermissionError,
            Anthropic::Models::BetaNotFoundError,
            Anthropic::Models::BetaRateLimitError,
            Anthropic::Models::BetaGatewayTimeoutError,
            Anthropic::Models::BetaAPIError,
            Anthropic::Models::BetaOverloadedError
          )
        )
      end
      def error
      end

      sig do
        params(
          _: T.any(
            Anthropic::Models::BetaInvalidRequestError,
            Anthropic::Models::BetaAuthenticationError,
            Anthropic::Models::BetaBillingError,
            Anthropic::Models::BetaPermissionError,
            Anthropic::Models::BetaNotFoundError,
            Anthropic::Models::BetaRateLimitError,
            Anthropic::Models::BetaGatewayTimeoutError,
            Anthropic::Models::BetaAPIError,
            Anthropic::Models::BetaOverloadedError
          )
        )
          .returns(
            T.any(
              Anthropic::Models::BetaInvalidRequestError,
              Anthropic::Models::BetaAuthenticationError,
              Anthropic::Models::BetaBillingError,
              Anthropic::Models::BetaPermissionError,
              Anthropic::Models::BetaNotFoundError,
              Anthropic::Models::BetaRateLimitError,
              Anthropic::Models::BetaGatewayTimeoutError,
              Anthropic::Models::BetaAPIError,
              Anthropic::Models::BetaOverloadedError
            )
          )
      end
      def error=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(
          error: T.any(
            Anthropic::Models::BetaInvalidRequestError,
            Anthropic::Util::AnyHash,
            Anthropic::Models::BetaAuthenticationError,
            Anthropic::Models::BetaBillingError,
            Anthropic::Models::BetaPermissionError,
            Anthropic::Models::BetaNotFoundError,
            Anthropic::Models::BetaRateLimitError,
            Anthropic::Models::BetaGatewayTimeoutError,
            Anthropic::Models::BetaAPIError,
            Anthropic::Models::BetaOverloadedError
          ),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(error:, type: :error)
      end

      sig do
        override
          .returns(
            {
              error: T.any(
                Anthropic::Models::BetaInvalidRequestError,
                Anthropic::Models::BetaAuthenticationError,
                Anthropic::Models::BetaBillingError,
                Anthropic::Models::BetaPermissionError,
                Anthropic::Models::BetaNotFoundError,
                Anthropic::Models::BetaRateLimitError,
                Anthropic::Models::BetaGatewayTimeoutError,
                Anthropic::Models::BetaAPIError,
                Anthropic::Models::BetaOverloadedError
              ),
              type: Symbol
            }
          )
      end
      def to_hash
      end
    end
  end
end
