# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::UserUsageReportTest < Anthropic::Test::ResourceTest
  def test_list_required_params
    response =
      @anthropic.beta.organization.analytics.user_usage_report.list(starting_at: "2019-12-27T18:11:19.117Z")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem
    end

    assert_pattern do
      row => {
        actor: Anthropic::Beta::Organization::BetaAnalyticsUserActor,
        cache_creation: Anthropic::Beta::BetaCacheCreation,
        cache_read_input_tokens: Integer,
        claude_tag_category: Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory | nil,
        claude_tag_user_id: String | nil,
        context_window: Anthropic::Beta::Organization::BetaAnalyticsContextWindow | nil,
        ending_at: Time | nil,
        inference_geo: Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo | nil,
        model: String | nil,
        output_tokens: Integer,
        product: String | nil,
        rbac_group_id: String | nil,
        requests: Integer | nil,
        server_tool_use: Anthropic::Beta::Organization::BetaAnalyticsServerToolUse,
        slack_channel_id: String | nil,
        speed: Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed | nil,
        starting_at: Time | nil,
        total_tokens: Integer,
        uncached_input_tokens: Integer
      }
    end
  end
end
