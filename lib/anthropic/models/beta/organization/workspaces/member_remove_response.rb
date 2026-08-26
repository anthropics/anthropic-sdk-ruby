# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # @see Anthropic::Resources::Beta::Organization::Workspaces::Members#remove
          class MemberRemoveResponse < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   Deleted object type.
            #
            #   For Workspace Members, this is always `"workspace_member_deleted"`.
            #
            #   @return [Symbol, :workspace_member_deleted]
            required :type, const: :workspace_member_deleted

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

            # @!method initialize(user_id:, workspace_id:, type: :workspace_member_deleted)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::MemberRemoveResponse} for
            #   more details.
            #
            #   @param user_id [String] ID of the User.
            #
            #   @param workspace_id [String] ID of the Workspace.
            #
            #   @param type [Symbol, :workspace_member_deleted] Deleted object type.
          end
        end
      end
    end
  end
end
