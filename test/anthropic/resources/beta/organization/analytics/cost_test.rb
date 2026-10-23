# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::CostTest < Anthropic::Test::ResourceTest
  def test_list_required_params
    response =
      @anthropic.beta.organization.analytics.cost.list(
        starting_at: "2026-09-01T00:00:00Z",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Internal::ReportPageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostItem
    end

    assert_pattern do
      row => {
        cost: Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostMetrics,
        ending_at: Time,
        group: Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroup,
        starting_at: Time
      }
    end
  end
end
