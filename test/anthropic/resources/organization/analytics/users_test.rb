# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::Analytics::UsersTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.analytics.users.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::AnalyticsUserActivity
    end

    assert_pattern do
      row => {
        chat_metrics: Anthropic::Organization::AnalyticsChatMetrics,
        claude_code_metrics: Anthropic::Organization::AnalyticsClaudeCodeMetrics,
        cowork_metrics: Anthropic::Organization::AnalyticsCoworkMetrics,
        design_metrics: Anthropic::Organization::AnalyticsDesignMetrics,
        distinct_user_count: Integer | nil,
        office_metrics: Anthropic::Organization::AnalyticsOfficeMetrics,
        science_metrics: Anthropic::Organization::AnalyticsScienceMetrics,
        user: Anthropic::Organization::AnalyticsUser | nil,
        web_search_count: Integer,
        chat_cowork_unified_metrics: Anthropic::Organization::AnalyticsChatCoworkUnifiedMetrics | nil,
        claude_tag_metrics: Anthropic::Organization::AnalyticsClaudeTagMetrics | nil,
        last_activity_date: Date | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil
      }
    end
  end
end
