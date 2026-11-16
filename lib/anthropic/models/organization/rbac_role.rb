# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::RBACRoles#retrieve
      class RBACRole < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the RBAC Role.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   RFC 3339 datetime string indicating when the RBAC Role was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute display_name
        #   Name of the RBAC Role. For a built-in role, this is Anthropic's name for the
        #   access that the role grants. Anthropic may change this name, so to keep a
        #   lasting reference to a role, store its `id`.
        #
        #   @return [String]
        required :display_name, String

        # @!attribute source
        #   Whether the RBAC Role is built-in or custom. More values of `type` may be added,
        #   so do not treat every role that is not `built_in` as `custom`.
        #
        #   @return [Anthropic::Models::Organization::RBACRoleSourceBuiltIn, Anthropic::Models::Organization::RBACRoleSourceCustom]
        required :source, union: -> { Anthropic::Organization::RBACRoleSource }

        # @!attribute type
        #   Object type.
        #
        #   For RBAC Roles, this is always `"rbac_role"`.
        #
        #   @return [Symbol, :rbac_role]
        required :type, const: :rbac_role

        # @!attribute updated_at
        #   RFC 3339 datetime string indicating when the RBAC Role was last updated.
        #
        #   @return [Time]
        required :updated_at, Time

        # @!method initialize(id:, created_at:, display_name:, source:, updated_at:, type: :rbac_role)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::RBACRole} for more details.
        #
        #   @param id [String] ID of the RBAC Role.
        #
        #   @param created_at [Time] RFC 3339 datetime string indicating when the RBAC Role was created.
        #
        #   @param display_name [String] Name of the RBAC Role. For a built-in role, this is Anthropic's name for the acc
        #
        #   @param source [Anthropic::Models::Organization::RBACRoleSourceBuiltIn, Anthropic::Models::Organization::RBACRoleSourceCustom] Whether the RBAC Role is built-in or custom. More values of `type` may be added,
        #
        #   @param updated_at [Time] RFC 3339 datetime string indicating when the RBAC Role was last updated.
        #
        #   @param type [Symbol, :rbac_role] Object type.
      end
    end
  end
end
