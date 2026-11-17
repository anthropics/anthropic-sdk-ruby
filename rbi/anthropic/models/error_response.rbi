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

      sig { returns(T.nilable(String)) }
      attr_accessor :request_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error:
            T.any(
              Anthropic::InvalidRequestErrorObject::OrHash,
              Anthropic::AuthenticationErrorObject::OrHash,
              Anthropic::BillingErrorObject::OrHash,
              Anthropic::PermissionErrorObject::OrHash,
              Anthropic::NotFoundErrorObject::OrHash,
              Anthropic::RateLimitErrorObject::OrHash,
              Anthropic::GatewayTimeoutErrorObject::OrHash,
              Anthropic::APIErrorObject::OrHash,
              Anthropic::OverloadedErrorObject::OrHash
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
            error: Anthropic::ErrorObject::Variants,
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
