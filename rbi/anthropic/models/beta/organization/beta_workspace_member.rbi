# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaWorkspaceMember < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaWorkspaceMember,
                Anthropic::Internal::AnyHash
              )
            end

          # Object type.
          #
          # For Workspace Members, this is always `"workspace_member"`.
          sig { returns(Symbol) }
          attr_accessor :type

          # ID of the User.
          sig { returns(String) }
          attr_accessor :user_id

          # ID of the Workspace.
          sig { returns(String) }
          attr_accessor :workspace_id

          # Role of the Workspace Member.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
            )
          end
          attr_accessor :workspace_role

          sig do
            params(
              user_id: String,
              workspace_id: String,
              workspace_role:
                Anthropic::Beta::Organization::BetaWorkspaceRole::OrSymbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the User.
            user_id:,
            # ID of the Workspace.
            workspace_id:,
            # Role of the Workspace Member.
            workspace_role:,
            # Object type.
            #
            # For Workspace Members, this is always `"workspace_member"`.
            type: :workspace_member
          )
          end

          sig do
            override.returns(
              {
                type: Symbol,
                user_id: String,
                workspace_id: String,
                workspace_role:
                  Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
