# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::SpendLimitsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.beta.organization.spend_limits.retrieve("spend_limit_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaSpendLimit
    end

    assert_pattern do
      response => {
        id: String,
        amount: String | nil,
        created_at: Time,
        currency: String,
        is_enabled: Anthropic::Internal::Type::Boolean,
        period: Anthropic::Beta::Organization::BetaSpendLimitPeriod,
        scope: Anthropic::Beta::Organization::BetaSpendLimit::Scope,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.spend_limits.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaSpendLimit
    end

    assert_pattern do
      row => {
        id: String,
        amount: String | nil,
        created_at: Time,
        currency: String,
        is_enabled: Anthropic::Internal::Type::Boolean,
        period: Anthropic::Beta::Organization::BetaSpendLimitPeriod,
        scope: Anthropic::Beta::Organization::BetaSpendLimit::Scope,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @anthropic.beta.organization.spend_limits.delete("spend_limit_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::SpendLimitDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_set_required_params
    response =
      @anthropic.beta.organization.spend_limits.set(
        amount: "50000",
        scope: {type: :user, user_id: "user_01WCz1FkmYMm4gnmykNKUu3Q"}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaSpendLimit
    end

    assert_pattern do
      response => {
        id: String,
        amount: String | nil,
        created_at: Time,
        currency: String,
        is_enabled: Anthropic::Internal::Type::Boolean,
        period: Anthropic::Beta::Organization::BetaSpendLimitPeriod,
        scope: Anthropic::Beta::Organization::BetaSpendLimit::Scope,
        type: Symbol,
        updated_at: Time
      }
    end
  end
end
