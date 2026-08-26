# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaWorkspaceMember < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Object type.
          #
          #   For Workspace Members, this is always `"workspace_member"`.
          #
          #   @return [Symbol, :workspace_member]
          required :type, const: :workspace_member

          # @!attribute user_id
          #   ID of the User.
          #
          #   @return [String]
          required :user_id, String

          # @!attribute workspace_id
          #   ID of the Workspace.
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute workspace_role
          #   Role of the Workspace Member.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceRole]
          required :workspace_role, enum: -> { Anthropic::Beta::Organization::BetaWorkspaceRole }

          # @!method initialize(user_id:, workspace_id:, workspace_role:, type: :workspace_member)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaWorkspaceMember} for more details.
          #
          #   @param user_id [String] ID of the User.
          #
          #   @param workspace_id [String] ID of the Workspace.
          #
          #   @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceRole] Role of the Workspace Member.
          #
          #   @param type [Symbol, :workspace_member] Object type.
        end
      end
    end
  end
end
