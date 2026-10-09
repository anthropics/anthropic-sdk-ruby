# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::SkillsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.analytics.skills.list

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
        chat_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillChatMetrics,
        claude_code_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillClaudeCodeMetrics,
        cowork_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillCoworkMetrics,
        distinct_user_count: Integer,
        office_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeMetrics,
        skill_name: String,
        attributed_list_price: String | nil,
        chat_cowork_unified_metrics: Anthropic::Beta::Organization::BetaAnalyticsSkillActivity::ChatCoworkUnifiedMetrics | nil,
        currency: String | nil,
        enable_count: Integer | nil,
        estimated_overage_spend: String | nil,
        invocation_count: Integer | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        share_status: Anthropic::Beta::Organization::BetaAnalyticsSkillActivity::ShareStatus | nil,
        skill_display_name: String | nil,
        user_id: String | nil
      }
    end
  end
end
