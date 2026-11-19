# frozen_string_literal: true

require_relative "../../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.organization.claude_code.managed_settings.rbac_groups.retrieve(
        "rbac_group_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings
    end

    assert_pattern do
      response => {
        created_at: Time,
        rbac_group_id: String,
        rbac_group_status: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus,
        settings: ^(Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]) | nil,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response =
      @anthropic.beta.organization.claude_code.managed_settings.rbac_groups.list(
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettingsSummary
    end

    assert_pattern do
      row => {
        created_at: Time,
        rbac_group_id: String,
        rbac_group_status: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response =
      @anthropic.beta.organization.claude_code.managed_settings.rbac_groups.delete(
        "rbac_group_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaDeletedClaudeCodeRBACGroupManagedSettings
    end

    assert_pattern do
      response => {
        rbac_group_id: String,
        type: Symbol
      }
    end
  end

  def test_set_required_params
    response =
      @anthropic.beta.organization.claude_code.managed_settings.rbac_groups.set(
        "rbac_group_id",
        settings: {foo: "bar"},
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings
    end

    assert_pattern do
      response => {
        created_at: Time,
        rbac_group_id: String,
        rbac_group_status: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus,
        settings: ^(Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]) | nil,
        type: Symbol,
        updated_at: Time
      }
    end
  end
end
