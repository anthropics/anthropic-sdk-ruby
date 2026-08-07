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

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(type: T.any(Symbol, String), message: String).returns(
          Anthropic::ErrorObject::Variants
        )
      end
      def self.new(type:, message:)
      end
    end
  end
end
