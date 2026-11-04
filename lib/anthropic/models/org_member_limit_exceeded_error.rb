# frozen_string_literal: true

module Anthropic
  module Models
    # The organization has reached the member limit that Anthropic set for it. Pending
    # invites count toward the limit.
    class OrgMemberLimitExceededError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :org_member_limit_exceeded]

      # @return [Anthropic::Models::OrgMemberLimitExceededErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::OrgMemberLimitExceededErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
