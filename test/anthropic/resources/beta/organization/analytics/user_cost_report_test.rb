# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::UserCostReportTest < Anthropic::Test::ResourceTest
  def test_list_required_params
    response =
      @anthropic.beta.organization.analytics.user_cost_report.list(starting_at: "2019-12-27T18:11:19.117Z")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsCostUsersItem
    end

    assert_pattern do
      row => {
        actor: Anthropic::Beta::Organization::BetaAnalyticsUserActor,
        amount: String,
        claude_tag_category: Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory | nil,
        claude_tag_user_id: String | nil,
        context_window: Anthropic::Beta::Organization::BetaAnalyticsContextWindow | nil,
        cost_type: Anthropic::Beta::Organization::BetaAnalyticsCostType | nil,
        currency: String,
        ending_at: Time | nil,
        inference_geo: Anthropic::Beta::Organization::BetaAnalyticsCostUsersItem::InferenceGeo | nil,
        list_amount: String,
        model: String | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        requests: Integer | nil,
        slack_channel_id: String | nil,
        speed: Anthropic::Beta::Organization::BetaAnalyticsCostUsersItem::Speed | nil,
        starting_at: Time | nil,
        token_type: Anthropic::Beta::Organization::BetaAnalyticsTokenType | nil
      }
    end
  end
end
