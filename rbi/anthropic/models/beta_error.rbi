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
    end
  end
end
