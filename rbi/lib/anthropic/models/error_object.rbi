# typed: strong

module Anthropic
  module Models
    class ErrorObject < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::InvalidRequestError], [Symbol, Anthropic::Models::AuthenticationError_], [Symbol, Anthropic::Models::BillingError], [Symbol, Anthropic::Models::PermissionError], [Symbol, Anthropic::Models::NotFoundError_], [Symbol, Anthropic::Models::RateLimitError_], [Symbol, Anthropic::Models::GatewayTimeoutError], [Symbol, Anthropic::Models::APIErrorObject], [Symbol, Anthropic::Models::OverloadedError]]
            )
        end
        private def variants
        end
      end
    end
  end
end
