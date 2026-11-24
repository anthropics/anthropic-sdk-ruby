# frozen_string_literal: true

module Anthropic
  module Models
    # The organization has no active External Key with this ID. The message names the
    # field.
    class BetaExternalKeyNotFoundError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :external_key_not_found]

      # @return [Anthropic::Models::BetaExternalKeyNotFoundErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaExternalKeyNotFoundErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
