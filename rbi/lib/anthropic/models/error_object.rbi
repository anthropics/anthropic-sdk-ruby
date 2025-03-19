# typed: strong

module Anthropic
  module Models
    class ErrorObject < Anthropic::Union
      abstract!

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
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
          }
        end
    end
  end
end
