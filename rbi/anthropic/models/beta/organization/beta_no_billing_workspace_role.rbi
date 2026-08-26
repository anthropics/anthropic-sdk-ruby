# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaNoBillingWorkspaceRole
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WORKSPACE_ADMIN =
            T.let(
              :workspace_admin,
              Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::TaggedSymbol
            )
          WORKSPACE_DEVELOPER =
            T.let(
              :workspace_developer,
              Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::TaggedSymbol
            )
          WORKSPACE_RESTRICTED_DEVELOPER =
            T.let(
              :workspace_restricted_developer,
              Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::TaggedSymbol
            )
          WORKSPACE_USER =
            T.let(
              :workspace_user,
              Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::TaggedSymbol
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
