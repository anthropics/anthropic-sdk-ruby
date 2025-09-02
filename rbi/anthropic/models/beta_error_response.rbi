# typed: strong

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BetaErrorResponse, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::BetaError::Variants) }
      attr_accessor :error

      sig { returns(T.nilable(String)) }
      attr_accessor :request_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error:
            T.any(
              Anthropic::BetaInvalidRequestError::OrHash,
              Anthropic::BetaAuthenticationError::OrHash,
              Anthropic::BetaBillingError::OrHash,
              Anthropic::BetaPermissionError::OrHash,
              Anthropic::BetaNotFoundError::OrHash,
              Anthropic::BetaRateLimitError::OrHash,
              Anthropic::BetaGatewayTimeoutError::OrHash,
              Anthropic::BetaAPIError::OrHash,
              Anthropic::BetaOverloadedError::OrHash
            ),
          request_id: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error:, request_id:, type: :error)
      end

      sig do
        override.returns(
          {
            error: Anthropic::BetaError::Variants,
            request_id: T.nilable(String),
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
