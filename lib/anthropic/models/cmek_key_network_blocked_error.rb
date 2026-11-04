# frozen_string_literal: true

module Anthropic
  module Models
    # The key management service's network access controls blocked the request to the
    # workspace's customer-managed encryption key. The key itself may be healthy.
    class CMEKKeyNetworkBlockedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :cmek_key_network_blocked]

      # @return [Anthropic::Models::CMEKKeyNetworkBlockedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CMEKKeyNetworkBlockedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
