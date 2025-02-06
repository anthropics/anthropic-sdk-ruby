# typed: strong

module Anthropic
  module Models
    class ErrorResponse < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::InvalidRequestError,
            Anthropic::Models::AuthenticationError_,
            Anthropic::Models::BillingError,
            Anthropic::Models::PermissionError,
            Anthropic::Models::NotFoundError_,
            Anthropic::Models::RateLimitError_,
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
            Anthropic::Models::AuthenticationError_,
            Anthropic::Models::BillingError,
            Anthropic::Models::PermissionError,
            Anthropic::Models::NotFoundError_,
            Anthropic::Models::RateLimitError_,
            Anthropic::Models::GatewayTimeoutError,
            Anthropic::Models::APIErrorObject,
            Anthropic::Models::OverloadedError
          ),
          type: Symbol
        ).void
      end
      def initialize(error:, type: :error)
      end

      sig do
        override.returns(
          {
            error: T.any(
              Anthropic::Models::InvalidRequestError,
              Anthropic::Models::AuthenticationError_,
              Anthropic::Models::BillingError,
              Anthropic::Models::PermissionError,
              Anthropic::Models::NotFoundError_,
              Anthropic::Models::RateLimitError_,
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
