# typed: strong

module Anthropic
  module Models
    # The workspace's customer-managed encryption key is disabled or revoked.
    # Re-enable the key, then retry.
    class CMEKKeyDisabledError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CMEKKeyDisabledErrorDetails) }
      def details
      end
    end
  end
end
