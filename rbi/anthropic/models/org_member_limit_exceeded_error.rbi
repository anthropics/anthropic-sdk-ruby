# typed: strong

module Anthropic
  module Models
    # The organization has reached the member limit that Anthropic set for it. Pending
    # invites count toward the limit.
    class OrgMemberLimitExceededError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::OrgMemberLimitExceededErrorDetails) }
      def details
      end
    end
  end
end
