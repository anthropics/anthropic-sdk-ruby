# typed: strong

module Anthropic
  module Models
    module ErrorObject
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::InvalidRequestError,
            Anthropic::AuthenticationError,
            Anthropic::BillingError,
            Anthropic::PermissionError,
            Anthropic::NotFoundError,
            Anthropic::RateLimitError,
            Anthropic::GatewayTimeoutError,
            Anthropic::APIErrorObject,
            Anthropic::OverloadedError
          )
        end

      sig { override.returns(T::Array[Anthropic::ErrorObject::Variants]) }
      def self.variants
      end
    end
  end
end
