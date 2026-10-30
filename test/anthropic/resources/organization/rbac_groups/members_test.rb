# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::RBACGroups::MembersTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.rbac_groups.members.list("rbac_group_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::RBACGroups::RBACGroupMember
    end

    assert_pattern do
      row => {
        created_at: Time,
        email: String,
        rbac_group_id: String,
        type: Symbol,
        user_id: String
      }
    end
  end

  def test_add_required_params
    response =
      @anthropic.organization.rbac_groups.members.add(
        "rbac_group_id",
        user_id: "user_01WxYzAbCdEfGhJkMnPqRsTu"
      )

    assert_pattern do
      response => Anthropic::Organization::RBACGroups::RBACGroupMember
    end

    assert_pattern do
      response => {
        created_at: Time,
        email: String,
        rbac_group_id: String,
        type: Symbol,
        user_id: String
      }
    end
  end

  def test_remove_required_params
    response = @anthropic.organization.rbac_groups.members.remove("user_id", rbac_group_id: "rbac_group_id")

    assert_pattern do
      response => Anthropic::Organization::RBACGroups::DeletedRBACGroupMember
    end

    assert_pattern do
      response => {
        rbac_group_id: String,
        type: Symbol,
        user_id: String
      }
    end
  end
end
