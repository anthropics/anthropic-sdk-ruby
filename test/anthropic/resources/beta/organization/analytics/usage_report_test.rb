# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::UsageReportTest < Anthropic::Test::ResourceTest
  def test_list_required_params
    response =
      @anthropic.beta.organization.analytics.usage_report.list(starting_at: "2019-12-27T18:11:19.117Z")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsUsageReportTimeBucket
    end

    assert_pattern do
      row => {
        ending_at: Time,
        results: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaAnalyticsUsageBucketedResult]),
        starting_at: Time
      }
    end
  end
end
