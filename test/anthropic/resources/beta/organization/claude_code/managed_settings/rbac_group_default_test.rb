# frozen_string_literal: true

require_relative "../../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.organization.claude_code.managed_settings.rbac_group_default.retrieve(
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings
    end

    assert_pattern do
      response => {
        settings: ^(Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]) | nil,
        type: Symbol,
        updated_at: Time | nil
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.claude_code.managed_settings.rbac_group_default.update(
        settings: {foo: "bar"},
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings
    end

    assert_pattern do
      response => {
        settings: ^(Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]) | nil,
        type: Symbol,
        updated_at: Time | nil
      }
    end
  end
end
