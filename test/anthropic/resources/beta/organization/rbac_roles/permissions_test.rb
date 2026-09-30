# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::RBACRoles::PermissionsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.rbac_roles.permissions.list("rbac_role_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission
    end

    assert_pattern do
      row => {
        action: String,
        resource: Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource,
        type: Symbol
      }
    end
  end
end
