# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class WorkspaceMemberLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :workspace_member_limit_exceeded]
        required :error_code, const: :workspace_member_limit_exceeded

        # @!method initialize(error_code: :workspace_member_limit_exceeded)
        #   The workspace has reached the member limit that Anthropic set for it.
        #
        #   @param error_code [Symbol, :workspace_member_limit_exceeded]
      end
    end
  end
end
