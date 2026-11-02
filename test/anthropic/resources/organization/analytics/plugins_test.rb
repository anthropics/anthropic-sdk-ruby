# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::Analytics::PluginsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.analytics.plugins.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::AnalyticsPluginActivity
    end

    assert_pattern do
      row => {
        claude_code_metrics: Anthropic::Organization::AnalyticsPluginClaudeCodeMetrics,
        cowork_metrics: Anthropic::Organization::AnalyticsPluginCoworkMetrics,
        distinct_user_count: Integer,
        install_count: Integer | nil,
        invocation_count: Integer,
        plugin_id: String | nil,
        plugin_name: String,
        chat_cowork_unified_metrics: Anthropic::Organization::AnalyticsPluginChatCoworkUnifiedMetrics | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user_id: String | nil
      }
    end
  end
end
