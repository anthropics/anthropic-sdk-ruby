# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::UsageTest < Anthropic::Test::ResourceTest
  def test_list_required_params
    response = @anthropic.beta.organization.analytics.usage.list(starting_at: "2026-09-01T00:00:00Z")

    assert_pattern do
      response => Anthropic::Internal::ReportPageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageItem
    end

    assert_pattern do
      row => {
        ending_at: Time,
        group: Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageGroup,
        starting_at: Time,
        usage: Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics
      }
    end
  end
end
