# typed: strong

module Anthropic
  module Models
    module Organization
      module WorkspaceRole
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::Organization::WorkspaceRole) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WORKSPACE_ADMIN =
          T.let(
            :workspace_admin,
            Anthropic::Organization::WorkspaceRole::TaggedSymbol
          )
        WORKSPACE_BILLING =
          T.let(
            :workspace_billing,
            Anthropic::Organization::WorkspaceRole::TaggedSymbol
          )
        WORKSPACE_DEVELOPER =
          T.let(
            :workspace_developer,
            Anthropic::Organization::WorkspaceRole::TaggedSymbol
          )
        WORKSPACE_RESTRICTED_DEVELOPER =
          T.let(
            :workspace_restricted_developer,
            Anthropic::Organization::WorkspaceRole::TaggedSymbol
          )
        WORKSPACE_USER =
          T.let(
            :workspace_user,
            Anthropic::Organization::WorkspaceRole::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::Organization::WorkspaceRole::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
