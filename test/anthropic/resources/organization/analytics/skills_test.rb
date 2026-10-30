# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::Analytics::SkillsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.analytics.skills.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::AnalyticsSkillActivity
    end

    assert_pattern do
      row => {
        attributed_list_price: String | nil,
        chat_metrics: Anthropic::Organization::AnalyticsSkillChatMetrics,
        claude_code_metrics: Anthropic::Organization::AnalyticsSkillClaudeCodeMetrics,
        cowork_metrics: Anthropic::Organization::AnalyticsSkillCoworkMetrics,
        currency: String | nil,
        distinct_user_count: Integer,
        enable_count: Integer | nil,
        estimated_overage_spend: String | nil,
        invocation_count: Integer | nil,
        office_metrics: Anthropic::Organization::AnalyticsSkillOfficeMetrics,
        share_status: Anthropic::Organization::AnalyticsSkillActivity::ShareStatus | nil,
        skill_display_name: String | nil,
        skill_name: String,
        chat_cowork_unified_metrics: Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedMetrics | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user_id: String | nil
      }
    end
  end
end
