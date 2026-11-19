# frozen_string_literal: true

require_relative "../../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.organization.claude_code.managed_settings.configuration.retrieve(
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration
    end

    assert_pattern do
      response => {
        mode: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsMode,
        mode_updated_at: Time | nil,
        rbac_group_order: ^(Anthropic::Internal::Type::ArrayOf[String]),
        rbac_group_order_version: String,
        type: Symbol
      }
    end
  end

  def test_update
    response =
      @anthropic.beta.organization.claude_code.managed_settings.configuration.update(
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration
    end

    assert_pattern do
      response => {
        mode: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsMode,
        mode_updated_at: Time | nil,
        rbac_group_order: ^(Anthropic::Internal::Type::ArrayOf[String]),
        rbac_group_order_version: String,
        type: Symbol
      }
    end
  end
end
