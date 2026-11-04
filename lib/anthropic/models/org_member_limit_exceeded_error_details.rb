# frozen_string_literal: true

module Anthropic
  module Models
    class OrgMemberLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :org_member_limit_exceeded]
      required :error_code, const: :org_member_limit_exceeded

      # @!method initialize(error_code: :org_member_limit_exceeded)
      #   The organization has reached the member limit that Anthropic set for it. Pending
      #   invites count toward the limit.
      #
      #   @param error_code [Symbol, :org_member_limit_exceeded]
    end
  end
end
