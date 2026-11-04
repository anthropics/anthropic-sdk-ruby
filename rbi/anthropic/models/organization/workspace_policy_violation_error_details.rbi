# typed: strong

module Anthropic
  module Models
    module Organization
      class WorkspacePolicyViolationErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::WorkspacePolicyViolationErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The request field the broken rule applies to.
        sig do
          returns(Anthropic::Organization::WorkspacePolicyField::TaggedSymbol)
        end
        attr_accessor :field

        # The request breaks the organization's Workspace Policy. The message says which
        # rule it broke; an organization admin can see and change the policy in the
        # Console.
        sig do
          params(
            field: Anthropic::Organization::WorkspacePolicyField::OrSymbol,
            error_code: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The request field the broken rule applies to.
          field:,
          error_code: :workspace_policy_violation
        )
        end

        sig do
          override.returns(
            {
              error_code: Symbol,
              field: Anthropic::Organization::WorkspacePolicyField::TaggedSymbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
