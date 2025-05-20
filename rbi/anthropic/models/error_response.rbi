# typed: strong

module Anthropic
  module Models
    class ErrorResponse < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ErrorResponse, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::ErrorObject::Variants) }
      attr_accessor :error

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error:
            T.any(
              Anthropic::InvalidRequestError::OrHash,
              Anthropic::AuthenticationError::OrHash,
              Anthropic::BillingError::OrHash,
              Anthropic::PermissionError::OrHash,
              Anthropic::NotFoundError::OrHash,
              Anthropic::RateLimitError::OrHash,
              Anthropic::GatewayTimeoutError::OrHash,
              Anthropic::APIErrorObject::OrHash,
              Anthropic::OverloadedError::OrHash
            ),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error:, type: :error)
      end

      sig do
        override.returns(
          { error: Anthropic::ErrorObject::Variants, type: Symbol }
        )
      end
      def to_hash
      end
    end
  end
end
