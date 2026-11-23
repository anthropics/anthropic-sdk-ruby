# typed: strong

module Anthropic
  module Models
    module Organization
      # The Workspace was created, but some of what the request asked for did not take
      # effect, or may not have. Don't send the create again. The error's `message` says
      # what to do with the Workspace at `workspace_id`.
      class WorkspaceCreatedIncompleteError < Anthropic::Errors::ServiceUnavailableError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::WorkspaceCreatedIncompleteErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
