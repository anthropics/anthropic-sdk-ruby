# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::RBACRoles::PermissionsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.rbac_roles.permissions.list("rbac_role_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::RBACRoles::RBACRolePermission
    end

    assert_pattern do
      row => {
        action: String,
        resource: Anthropic::Organization::RBACRoles::RBACRolePermission::Resource,
        type: Symbol
      }
    end
  end
end
