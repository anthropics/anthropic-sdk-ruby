# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::SummariesTest < Anthropic::Test::ResourceTest
  def test_list_required_params
    response = @anthropic.beta.organization.analytics.summaries.list(starting_date: "2019-12-27")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsSingleDayActivitySummary
    end

    assert_pattern do
      row => {
        assigned_seat_count: Integer | nil,
        cowork_daily_active_user_count: Integer,
        cowork_monthly_active_user_count: Integer,
        cowork_weekly_active_user_count: Integer,
        daily_active_user_count: Integer,
        daily_adoption_rate: Float | nil,
        ending_at: Time,
        monthly_active_user_count: Integer,
        monthly_adoption_rate: Float | nil,
        pending_invite_count: Integer | nil,
        starting_at: Time,
        weekly_active_user_count: Integer,
        weekly_adoption_rate: Float | nil,
        chat_daily_active_user_count: Integer | nil,
        chat_monthly_active_user_count: Integer | nil,
        chat_weekly_active_user_count: Integer | nil,
        claude_code_daily_active_user_count: Integer | nil,
        claude_code_monthly_active_user_count: Integer | nil,
        claude_code_weekly_active_user_count: Integer | nil,
        claude_design_daily_active_user_count: Integer | nil,
        claude_design_monthly_active_user_count: Integer | nil,
        claude_design_weekly_active_user_count: Integer | nil,
        office_agent_daily_active_user_count: Integer | nil,
        office_agent_monthly_active_user_count: Integer | nil,
        office_agent_weekly_active_user_count: Integer | nil,
        science_daily_active_user_count: Integer | nil,
        science_entitled_user_count: Integer | nil,
        science_monthly_active_user_count: Integer | nil,
        science_weekly_active_user_count: Integer | nil
      }
    end
  end
end
