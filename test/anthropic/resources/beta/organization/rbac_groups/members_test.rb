# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::RBACGroups::MembersTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.rbac_groups.members.list("rbac_group_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::RBACGroups::BetaRBACGroupMember
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
      @anthropic.beta.organization.rbac_groups.members.add(
        "rbac_group_id",
        user_id: "user_01WCz1FkmYMm4gnmykNKUu3Q"
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::RBACGroups::BetaRBACGroupMember
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
    response =
      @anthropic.beta.organization.rbac_groups.members.remove("user_id", rbac_group_id: "rbac_group_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::RBACGroups::MemberRemoveResponse
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
