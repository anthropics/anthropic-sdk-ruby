# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::PluginsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.analytics.plugins.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsPluginActivity
    end

    assert_pattern do
      row => {
        claude_code_metrics: Anthropic::Beta::Organization::BetaAnalyticsPluginClaudeCodeMetrics,
        cowork_metrics: Anthropic::Beta::Organization::BetaAnalyticsPluginCoworkMetrics,
        distinct_user_count: Integer,
        install_count: Integer | nil,
        invocation_count: Integer,
        plugin_name: String,
        plugin_id: String | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user_id: String | nil
      }
    end
  end
end
