# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACGroups
          # @see Anthropic::Resources::Beta::Organization::RBACGroups::Members#remove
          class MemberRemoveResponse < Anthropic::Internal::Type::BaseModel
            # @!attribute rbac_group_id
            #   ID of the RBAC Group.
            #
            #   @return [String]
            required :rbac_group_id, String

            # @!attribute type
            #   Deleted object type. For RBAC Group Members, this is always
            #   `"rbac_group_member_deleted"`.
            #
            #   @return [Symbol, :rbac_group_member_deleted]
            required :type, const: :rbac_group_member_deleted

            # @!attribute user_id
            #   ID of the User.
            #
            #   @return [String]
            required :user_id, String

            # @!method initialize(rbac_group_id:, user_id:, type: :rbac_group_member_deleted)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::RBACGroups::MemberRemoveResponse} for
            #   more details.
            #
            #   @param rbac_group_id [String] ID of the RBAC Group.
            #
            #   @param user_id [String] ID of the User.
            #
            #   @param type [Symbol, :rbac_group_member_deleted] Deleted object type. For RBAC Group Members, this is always `"rbac*group_member*
          end
        end
      end
    end
  end
end
