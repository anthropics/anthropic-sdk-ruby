# typed: strong

module Anthropic
  module Models
    # The key management service's network access controls blocked the request to the
    # workspace's customer-managed encryption key. The key itself may be healthy.
    class CMEKKeyNetworkBlockedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CMEKKeyNetworkBlockedErrorDetails) }
      def details
      end
    end
  end
end
