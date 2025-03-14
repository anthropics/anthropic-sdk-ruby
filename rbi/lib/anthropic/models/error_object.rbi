# typed: strong

module Anthropic
  module Models
    class ErrorObject < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError_, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError_, Anthropic::Models::RateLimitError_, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
            )
        end
        def variants
        end
      end
    end
  end
end
