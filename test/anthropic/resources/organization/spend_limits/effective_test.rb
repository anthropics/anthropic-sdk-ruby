# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::SpendLimits::EffectiveTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.spend_limits.effective.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::SpendSummary
    end

    assert_pattern do
      row => {
        actor: Anthropic::Organization::SpendSummary::Actor,
        amount: String | nil,
        currency: String,
        period: Anthropic::Organization::SpendLimitPeriod,
        period_to_date_spend: String,
        scope: Anthropic::Organization::SpendSummary::Scope,
        source: Anthropic::Organization::SpendSummary::Source,
        spend_limit_id: String
      }
    end
  end
end
