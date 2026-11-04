# frozen_string_literal: true

module Anthropic
  module Models
    # The workspace's customer-managed encryption key could not be reached. Retry the
    # request; if this continues, check that the key is available in your key
    # management service, or contact Anthropic support.
    class CMEKKeyUnreachableError < Anthropic::Errors::ServiceUnavailableError
      # @!method error_code
      #   @return [Symbol, :cmek_key_unreachable]

      # @return [Anthropic::Models::CMEKKeyUnreachableErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CMEKKeyUnreachableErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
