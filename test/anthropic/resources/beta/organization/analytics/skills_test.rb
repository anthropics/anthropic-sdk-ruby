# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::SkillsTest < Anthropic::Test::ResourceTest
  def test_list
    response =
      @anthropic.beta.organization.analytics.skills.list(request_options: {extra_query: {beta: "true"}})

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsSkillActivity
    end

    assert_pattern do
      row => {
        attributed_list_price: String | nil,
        chat_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillChatMetrics,
        claude_code_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillClaudeCodeMetrics,
        cowork_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillCoworkMetrics,
        currency: String | nil,
        distinct_user_count: Integer,
        enable_count: Integer | nil,
        estimated_overage_spend: String | nil,
        invocation_count: Integer | nil,
        office_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeMetrics,
        share_status: Anthropic::Beta::Organization::BetaAnalyticsSkillActivity::ShareStatus | nil,
        skill_display_name: String | nil,
        skill_name: String,
        chat_cowork_unified_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedMetrics | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user_id: String | nil
      }
    end
  end
end
