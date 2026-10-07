# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACRoles#retrieve
        class BetaRBACRole < Anthropic::Internal::Type::BaseModel
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
          #   Name of the RBAC Role. For a role created by Anthropic, this name can differ
          #   from the label claude.ai shows, and Anthropic may change the name. To keep a
          #   lasting reference to a role, store its `id`.
          #
          #   @return [String]
          required :display_name, String

          # @!attribute name
          #   @deprecated Use `display_name` instead; `name` always has the same value.
          #
          #   Deprecated: use `display_name` instead. Name of the RBAC Role; always the same
          #   value as `display_name`.
          #
          #   @return [String]
          required :name, String

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

          # @!method initialize(id:, created_at:, display_name:, name:, updated_at:, type: :rbac_role)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaRBACRole} for more details.
          #
          #   @param id [String] ID of the RBAC Role.
          #
          #   @param created_at [Time] RFC 3339 datetime string indicating when the RBAC Role was created.
          #
          #   @param display_name [String] Name of the RBAC Role. For a role created by Anthropic, this name can differ fro
          #
          #   @param name [String] Deprecated: use `display_name` instead. Name of the RBAC Role; always the same v
          #
          #   @param updated_at [Time] RFC 3339 datetime string indicating when the RBAC Role was last updated.
          #
          #   @param type [Symbol, :rbac_role] Object type.
        end
      end
    end
  end
end
