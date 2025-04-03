# typed: strong

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::Internal::Type::BaseModel
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
      attr_accessor :error

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error: T.any(
            Anthropic::Models::BetaInvalidRequestError,
            Anthropic::Internal::AnyHash,
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
