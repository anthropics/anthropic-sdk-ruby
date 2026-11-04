# typed: strong

module Anthropic
  module Models
    module Organization
      # The workspace has reached its limit of active API keys.
      class WorkspaceAPIKeyLimitExceededError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::WorkspaceAPIKeyLimitExceededErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
