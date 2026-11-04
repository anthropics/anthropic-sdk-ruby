# typed: strong

module Anthropic
  module Models
    module Organization
      # The request breaks the organization's Workspace Policy. The message says which
      # rule it broke; an organization admin can see and change the policy in the
      # Console.
      class WorkspacePolicyViolationError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Organization::WorkspacePolicyViolationErrorDetails)
        end
        def details
        end
      end
    end
  end
end
