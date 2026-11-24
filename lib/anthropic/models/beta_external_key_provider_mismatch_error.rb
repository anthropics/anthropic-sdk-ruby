# frozen_string_literal: true

module Anthropic
  module Models
    # The External Key is held by a key management service that this endpoint does not
    # take. The message names the field and the service it takes.
    class BetaExternalKeyProviderMismatchError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :external_key_provider_mismatch]

      # @return [Anthropic::Models::BetaExternalKeyProviderMismatchErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaExternalKeyProviderMismatchErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
