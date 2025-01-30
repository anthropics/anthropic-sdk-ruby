# typed: strong

module Anthropic
  module Models
    class ErrorObject < Anthropic::Union
      abstract!

      Variants = T.type_alias do
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
      end

      sig do
        override.returns(
          [
            [Symbol, Anthropic::Models::InvalidRequestError],
            [Symbol, Anthropic::Models::AuthenticationError_],
            [Symbol, Anthropic::Models::BillingError],
            [Symbol, Anthropic::Models::PermissionError],
            [Symbol, Anthropic::Models::NotFoundError_],
            [Symbol, Anthropic::Models::RateLimitError_],
            [Symbol, Anthropic::Models::GatewayTimeoutError],
            [Symbol, Anthropic::Models::APIErrorObject],
            [Symbol, Anthropic::Models::OverloadedError]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
