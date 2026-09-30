# typed: strong

module Anthropic
  module Models
    module Organization
      class WorkspaceMember < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::WorkspaceMember,
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
        sig { returns(Anthropic::Organization::WorkspaceRole::TaggedSymbol) }
        attr_accessor :workspace_role

        sig do
          params(
            user_id: String,
            workspace_id: String,
            workspace_role: Anthropic::Organization::WorkspaceRole::OrSymbol,
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
                Anthropic::Organization::WorkspaceRole::TaggedSymbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
