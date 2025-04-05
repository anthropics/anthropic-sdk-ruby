# typed: strong

module Anthropic
  module Models
    class ErrorResponse < Anthropic::Internal::Type::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::InvalidRequestError,
            Anthropic::Models::AuthenticationError,
            Anthropic::Models::BillingError,
            Anthropic::Models::PermissionError,
            Anthropic::Models::NotFoundError,
            Anthropic::Models::RateLimitError,
            Anthropic::Models::GatewayTimeoutError,
            Anthropic::Models::APIErrorObject,
            Anthropic::Models::OverloadedError
          )
        )
      end
      attr_accessor :error

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error: T.any(
            Anthropic::Models::InvalidRequestError,
            Anthropic::Internal::AnyHash,
            Anthropic::Models::AuthenticationError,
            Anthropic::Models::BillingError,
            Anthropic::Models::PermissionError,
            Anthropic::Models::NotFoundError,
            Anthropic::Models::RateLimitError,
            Anthropic::Models::GatewayTimeoutError,
            Anthropic::Models::APIErrorObject,
            Anthropic::Models::OverloadedError
          ),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(error:, type: :error); end

      sig do
        override
          .returns(
            {
              error: T.any(
                Anthropic::Models::InvalidRequestError,
                Anthropic::Models::AuthenticationError,
                Anthropic::Models::BillingError,
                Anthropic::Models::PermissionError,
                Anthropic::Models::NotFoundError,
                Anthropic::Models::RateLimitError,
                Anthropic::Models::GatewayTimeoutError,
                Anthropic::Models::APIErrorObject,
                Anthropic::Models::OverloadedError
              ),
              type: Symbol
            }
          )
      end
      def to_hash; end
    end
  end
end
