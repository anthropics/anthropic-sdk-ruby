# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACGroups
          # @see Anthropic::Resources::Beta::Organization::RBACGroups::Members#list
          class BetaRBACGroupMember < Anthropic::Internal::Type::BaseModel
            # @!attribute created_at
            #   RFC 3339 timestamp of when the User was added to the RBAC Group.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute email
            #   Email of the User.
            #
            #   @return [String]
            required :email, String

            # @!attribute rbac_group_id
            #   ID of the RBAC Group.
            #
            #   @return [String]
            required :rbac_group_id, String

            # @!attribute type
            #   Object type.
            #
            #   For RBAC Group Members, this is always `"rbac_group_member"`.
            #
            #   @return [Symbol, :rbac_group_member]
            required :type, const: :rbac_group_member

            # @!attribute user_id
            #   ID of the User.
            #
            #   @return [String]
            required :user_id, String

            # @!method initialize(created_at:, email:, rbac_group_id:, user_id:, type: :rbac_group_member)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::RBACGroups::BetaRBACGroupMember} for
            #   more details.
            #
            #   @param created_at [Time] RFC 3339 timestamp of when the User was added to the RBAC Group.
            #
            #   @param email [String] Email of the User.
            #
            #   @param rbac_group_id [String] ID of the RBAC Group.
            #
            #   @param user_id [String] ID of the User.
            #
            #   @param type [Symbol, :rbac_group_member] Object type.
          end
        end
      end
    end
  end
end
