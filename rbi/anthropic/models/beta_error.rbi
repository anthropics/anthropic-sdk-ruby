# typed: strong

module Anthropic
  module Models
    module BetaError
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::BetaInvalidRequestError,
            Anthropic::BetaAuthenticationError,
            Anthropic::BetaBillingError,
            Anthropic::BetaPermissionError,
            Anthropic::BetaNotFoundError,
            Anthropic::BetaRateLimitError,
            Anthropic::BetaGatewayTimeoutError,
            Anthropic::BetaAPIError,
            Anthropic::BetaOverloadedError
          )
        end

      sig { override.returns(T::Array[Anthropic::BetaError::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(type: T.any(Symbol, String), message: String).returns(
          Anthropic::BetaError::Variants
        )
      end
      def self.new(type:, message:)
      end
    end
  end
end
