# frozen_string_literal: true

module Anthropic
  module Models
    class CmekKeyNetworkBlockedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :cmek_key_network_blocked]
      required :error_code, const: :cmek_key_network_blocked

      # @!method initialize(error_code: :cmek_key_network_blocked)
      #   The key management service's network access controls blocked the request to the
      #   workspace's customer-managed encryption key. The key itself may be healthy.
      #
      #   @param error_code [Symbol, :cmek_key_network_blocked]
    end
  end
end
