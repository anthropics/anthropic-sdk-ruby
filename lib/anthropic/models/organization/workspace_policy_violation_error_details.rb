# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class WorkspacePolicyViolationErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :workspace_policy_violation]
        required :error_code, const: :workspace_policy_violation

        # @!attribute field
        #   The request field the broken rule applies to.
        #
        #   @return [Symbol, Anthropic::Models::Organization::WorkspacePolicyField]
        required :field, enum: -> { Anthropic::Organization::WorkspacePolicyField }

        # @!method initialize(field:, error_code: :workspace_policy_violation)
        #   The request breaks the organization's Workspace Policy. The message says which
        #   rule it broke; an organization admin can see and change the policy in the
        #   Console.
        #
        #   @param field [Symbol, Anthropic::Models::Organization::WorkspacePolicyField] The request field the broken rule applies to.
        #
        #   @param error_code [Symbol, :workspace_policy_violation]
      end
    end
  end
end
