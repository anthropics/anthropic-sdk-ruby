# typed: strong

module Anthropic
  module Models
    # Another change to the organization's members is in progress. Retry the request
    # once it completes.
    class ConcurrentMembershipChangeError < Anthropic::Errors::ConflictError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ConcurrentMembershipChangeErrorDetails) }
      def details
      end
    end
  end
end
