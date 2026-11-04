# typed: strong

module Anthropic
  module Models
    module Organization
      # The workspace has reached the member limit that Anthropic set for it.
      class WorkspaceMemberLimitExceededError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::WorkspaceMemberLimitExceededErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
