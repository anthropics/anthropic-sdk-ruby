# frozen_string_literal: true

module Anthropic
  module Models
    # The workspace's customer-managed encryption key is disabled or revoked.
    # Re-enable the key, then retry.
    class CMEKKeyDisabledError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :cmek_key_disabled]

      # @return [Anthropic::Models::CMEKKeyDisabledErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CMEKKeyDisabledErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
