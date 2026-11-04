# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The workspace has reached the member limit that Anthropic set for it.
      class WorkspaceMemberLimitExceededError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :workspace_member_limit_exceeded]

        # @return [Anthropic::Models::Organization::WorkspaceMemberLimitExceededErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::WorkspaceMemberLimitExceededErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
