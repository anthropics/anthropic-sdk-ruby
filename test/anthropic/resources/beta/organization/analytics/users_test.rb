# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::UsersTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.analytics.users.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsUserActivity
    end

    assert_pattern do
      row => {
        chat_metrics: Anthropic::Beta::Organization::BetaAnalyticsChatMetrics,
        claude_code_metrics: Anthropic::Beta::Organization::BetaAnalyticsClaudeCodeMetrics,
        cowork_metrics: Anthropic::Beta::Organization::BetaAnalyticsCoworkMetrics,
        design_metrics: Anthropic::Beta::Organization::BetaAnalyticsDesignMetrics,
        office_metrics: Anthropic::Beta::Organization::BetaAnalyticsOfficeMetrics,
        science_metrics: Anthropic::Beta::Organization::BetaAnalyticsScienceMetrics,
        web_search_count: Integer,
        distinct_user_count: Integer | nil,
        last_activity_date: Date | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user: Anthropic::Beta::Organization::BetaAnalyticsUser | nil
      }
    end
  end
end
