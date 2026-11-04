# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The request breaks the organization's Workspace Policy. The message says which
      # rule it broke; an organization admin can see and change the policy in the
      # Console.
      class WorkspacePolicyViolationError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :workspace_policy_violation]

        # @return [Anthropic::Models::Organization::WorkspacePolicyViolationErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::WorkspacePolicyViolationErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
