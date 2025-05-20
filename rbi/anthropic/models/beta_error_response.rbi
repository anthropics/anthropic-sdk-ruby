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
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error:, type: :error)
      end

      sig do
        override.returns(
          { error: Anthropic::BetaError::Variants, type: Symbol }
        )
      end
      def to_hash
      end
    end
  end
end
