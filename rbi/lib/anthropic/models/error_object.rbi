# typed: strong

module Anthropic
  module Models
    module ErrorObject
      extend Anthropic::Union

      sig do
        override
          .returns(
            [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
          )
      end
      def self.variants
      end
    end
  end
end
