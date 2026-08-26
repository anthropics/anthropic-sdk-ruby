# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaWorkspaceRole
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::Organization::BetaWorkspaceRole)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WORKSPACE_ADMIN =
            T.let(
              :workspace_admin,
              Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
            )
          WORKSPACE_BILLING =
            T.let(
              :workspace_billing,
              Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
            )
          WORKSPACE_DEVELOPER =
            T.let(
              :workspace_developer,
              Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
            )
          WORKSPACE_RESTRICTED_DEVELOPER =
            T.let(
              :workspace_restricted_developer,
              Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
            )
          WORKSPACE_USER =
            T.let(
              :workspace_user,
              Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
