# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::ConnectorsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.analytics.connectors.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity
    end

    assert_pattern do
      row => {
        chat_metrics: Anthropic::Beta::Organization::BetaAnalyticsConnectorChatMetrics,
        claude_code_metrics: Anthropic::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics,
        connector_name: String,
        cowork_metrics: Anthropic::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics,
        distinct_user_count: Integer,
        office_metrics: Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics,
        chat_cowork_unified_metrics: Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics | nil,
        connector_display_name: String | nil,
        individual_auth_distinct_user_count: Integer | nil,
        managed_auth_distinct_user_count: Integer | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        read_call_count: Integer | nil,
        unclassified_call_count: Integer | nil,
        user_id: String | nil,
        write_call_count: Integer | nil
      }
    end
  end
end
