# typed: strong

module Anthropic
  module Models
    module Organization
      module NoBillingWorkspaceRole
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::NoBillingWorkspaceRole)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WORKSPACE_ADMIN =
          T.let(
            :workspace_admin,
            Anthropic::Organization::NoBillingWorkspaceRole::TaggedSymbol
          )
        WORKSPACE_DEVELOPER =
          T.let(
            :workspace_developer,
            Anthropic::Organization::NoBillingWorkspaceRole::TaggedSymbol
          )
        WORKSPACE_RESTRICTED_DEVELOPER =
          T.let(
            :workspace_restricted_developer,
            Anthropic::Organization::NoBillingWorkspaceRole::TaggedSymbol
          )
        WORKSPACE_USER =
          T.let(
            :workspace_user,
            Anthropic::Organization::NoBillingWorkspaceRole::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::NoBillingWorkspaceRole::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
