# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class MemberRemoveResponse < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Models::Beta::Organization::Workspaces::MemberRemoveResponse,
                  Anthropic::Internal::AnyHash
                )
              end

            # Deleted object type.
            #
            # For Workspace Members, this is always `"workspace_member_deleted"`.
            sig { returns(Symbol) }
            attr_accessor :type

            # ID of the User.
            sig { returns(String) }
            attr_accessor :user_id

            # ID of the Workspace.
            sig { returns(String) }
            attr_accessor :workspace_id

            sig do
              params(
                user_id: String,
                workspace_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the User.
              user_id:,
              # ID of the Workspace.
              workspace_id:,
              # Deleted object type.
              #
              # For Workspace Members, this is always `"workspace_member_deleted"`.
              type: :workspace_member_deleted
            )
            end

            sig do
              override.returns(
                { type: Symbol, user_id: String, workspace_id: String }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
