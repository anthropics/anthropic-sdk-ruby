# typed: strong

module Anthropic
  module Models
    # The workspace's customer-managed encryption key could not be reached. Retry the
    # request; if this continues, check that the key is available in your key
    # management service, or contact Anthropic support.
    class CMEKKeyUnreachableError < Anthropic::Errors::ServiceUnavailableError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CMEKKeyUnreachableErrorDetails) }
      def details
      end
    end
  end
end
