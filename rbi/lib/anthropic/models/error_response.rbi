# typed: strong

module Anthropic
  module Models
    class ErrorResponse < Anthropic::BaseModel
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
      def error
      end

      sig do
        params(
          _: T.any(
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
          .returns(
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
            Anthropic::Models::InvalidRequestError,
            Anthropic::Util::AnyHash,
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
      def self.new(error:, type: :error)
      end

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
      def to_hash
      end
    end
  end
end
