# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Workspaces::MembersTest < Anthropic::Test::ResourceTest
  def test_retrieve_required_params
    response =
      @anthropic.beta.organization.workspaces.members.retrieve("user_id", workspace_id: "workspace_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaWorkspaceMember
    end

    assert_pattern do
      response => {
        type: Symbol,
        user_id: String,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.workspaces.members.update(
        "user_id",
        workspace_id: "workspace_id",
        workspace_role: :workspace_admin
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaWorkspaceMember
    end

    assert_pattern do
      response => {
        type: Symbol,
        user_id: String,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.workspaces.members.list("workspace_id")

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaWorkspaceMember
    end

    assert_pattern do
      row => {
        type: Symbol,
        user_id: String,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_add_required_params
    response =
      @anthropic.beta.organization.workspaces.members.add(
        "workspace_id",
        user_id: "user_01WCz1FkmYMm4gnmykNKUu3Q",
        workspace_role: :workspace_admin
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaWorkspaceMember
    end

    assert_pattern do
      response => {
        type: Symbol,
        user_id: String,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_remove_required_params
    response =
      @anthropic.beta.organization.workspaces.members.remove("user_id", workspace_id: "workspace_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::Workspaces::MemberRemoveResponse
    end

    assert_pattern do
      response => {
        type: Symbol,
        user_id: String,
        workspace_id: String
      }
    end
  end
end
