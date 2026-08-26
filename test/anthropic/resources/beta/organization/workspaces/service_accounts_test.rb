# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Workspaces::ServiceAccountsTest < Anthropic::Test::ResourceTest
  def test_retrieve_required_params
    response =
      @anthropic.beta.organization.workspaces.service_accounts.retrieve(
        "service_account_id",
        workspace_id: "workspace_id"
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
    end

    assert_pattern do
      response => {
        created_by_actor_id: String | nil,
        implicit: Anthropic::Internal::Type::Boolean | nil,
        service_account_id: String,
        type: Symbol,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.workspaces.service_accounts.update(
        "service_account_id",
        workspace_id: "workspace_id",
        workspace_role: :workspace_admin
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
    end

    assert_pattern do
      response => {
        created_by_actor_id: String | nil,
        implicit: Anthropic::Internal::Type::Boolean | nil,
        service_account_id: String,
        type: Symbol,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.workspaces.service_accounts.list("workspace_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
    end

    assert_pattern do
      row => {
        created_by_actor_id: String | nil,
        implicit: Anthropic::Internal::Type::Boolean | nil,
        service_account_id: String,
        type: Symbol,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_add_required_params
    response =
      @anthropic.beta.organization.workspaces.service_accounts.add(
        "workspace_id",
        service_account_id: "service_account_id",
        workspace_role: :workspace_admin
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
    end

    assert_pattern do
      response => {
        created_by_actor_id: String | nil,
        implicit: Anthropic::Internal::Type::Boolean | nil,
        service_account_id: String,
        type: Symbol,
        workspace_id: String,
        workspace_role: Anthropic::Beta::Organization::BetaWorkspaceRole
      }
    end
  end

  def test_remove_required_params
    response =
      @anthropic.beta.organization.workspaces.service_accounts.remove(
        "service_account_id",
        workspace_id: "workspace_id"
      )

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountRemoveResponse
    end

    assert_pattern do
      response => {
        service_account_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end
end
