# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::SpendLimits::EffectiveTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.spend_limits.effective.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaSpendSummary
    end

    assert_pattern do
      row => {
        actor: Anthropic::Beta::Organization::BetaSpendSummary::Actor,
        amount: String | nil,
        currency: String,
        period: Anthropic::Beta::Organization::BetaSpendLimitPeriod,
        period_to_date_spend: String,
        scope: Anthropic::Beta::Organization::BetaSpendSummary::Scope,
        source: Anthropic::Beta::Organization::BetaSpendSummary::Source,
        spend_limit_id: String
      }
    end
  end
end
