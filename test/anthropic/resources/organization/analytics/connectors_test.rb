# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::Analytics::ConnectorsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.analytics.connectors.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::AnalyticsConnectorActivity
    end

    assert_pattern do
      row => {
        chat_metrics: Anthropic::Organization::AnalyticsConnectorChatMetrics,
        claude_code_metrics: Anthropic::Organization::AnalyticsConnectorClaudeCodeMetrics,
        connector_display_name: String | nil,
        connector_name: String,
        cowork_metrics: Anthropic::Organization::AnalyticsConnectorCoworkMetrics,
        distinct_user_count: Integer,
        individual_auth_distinct_user_count: Integer | nil,
        managed_auth_distinct_user_count: Integer | nil,
        office_metrics: Anthropic::Organization::AnalyticsConnectorOfficeMetrics,
        read_call_count: Integer | nil,
        unclassified_call_count: Integer | nil,
        write_call_count: Integer | nil,
        chat_cowork_unified_metrics: Anthropic::Organization::AnalyticsConnectorChatCoworkUnifiedMetrics | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user_id: String | nil
      }
    end
  end
end
