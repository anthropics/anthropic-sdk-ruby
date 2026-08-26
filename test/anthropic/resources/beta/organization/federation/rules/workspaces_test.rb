# frozen_string_literal: true

require_relative "../../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Federation::Rules::WorkspacesTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.federation.rules.workspaces.list("federation_rule_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Federation::BetaFederationRuleWorkspace
    end

    assert_pattern do
      row => {
        created_at: Time,
        created_by_actor_id: String | nil,
        federation_rule_id: String,
        type: Symbol,
        workspace_id: String,
        workspace_name: String | nil
      }
    end
  end

  def test_add_required_params
    response =
      @anthropic.beta.organization.federation.rules.workspaces.add(
        "federation_rule_id",
        workspace_id: "workspace_id"
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationRuleWorkspace
    end

    assert_pattern do
      response => {
        created_at: Time,
        created_by_actor_id: String | nil,
        federation_rule_id: String,
        type: Symbol,
        workspace_id: String,
        workspace_name: String | nil
      }
    end
  end

  def test_remove_required_params
    response =
      @anthropic.beta.organization.federation.rules.workspaces.remove(
        "workspace_id",
        federation_rule_id: "federation_rule_id"
      )

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceRemoveResponse
    end

    assert_pattern do
      response => {
        federation_rule_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end
end
