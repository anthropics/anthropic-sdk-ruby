# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::SpendLimits::IncreaseRequestsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.organization.spend_limits.increase_requests.retrieve("spend_limit_increase_request_id")

    assert_pattern do
      response => Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequest
    end

    assert_pattern do
      response => {
        id: String,
        actor: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestActor,
        created_at: Time,
        period: Anthropic::Organization::SpendLimitPeriod,
        resolved_at: Time | nil,
        resolved_by: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestResolvedBy | nil,
        spend_summary: Anthropic::Organization::SpendSummary | nil,
        status: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.organization.spend_limits.increase_requests.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequest
    end

    assert_pattern do
      row => {
        id: String,
        actor: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestActor,
        created_at: Time,
        period: Anthropic::Organization::SpendLimitPeriod,
        resolved_at: Time | nil,
        resolved_by: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestResolvedBy | nil,
        spend_summary: Anthropic::Organization::SpendSummary | nil,
        status: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus,
        type: Symbol
      }
    end
  end

  def test_approve_required_params
    response =
      @anthropic.organization.spend_limits.increase_requests.approve(
        "spend_limit_increase_request_id",
        amount: "50000"
      )

    assert_pattern do
      response => Anthropic::Models::Organization::SpendLimits::IncreaseRequestApproveResponse
    end

    assert_pattern do
      response => {
        id: String,
        actor: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestActor,
        created_at: Time,
        period: Anthropic::Organization::SpendLimitPeriod,
        resolved_at: Time | nil,
        resolved_by: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestResolvedBy | nil,
        spend_limit: Anthropic::Organization::SpendLimit,
        spend_summary: Anthropic::Organization::SpendSummary | nil,
        status: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus,
        type: Symbol
      }
    end
  end

  def test_deny
    response = @anthropic.organization.spend_limits.increase_requests.deny("spend_limit_increase_request_id")

    assert_pattern do
      response => Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequest
    end

    assert_pattern do
      response => {
        id: String,
        actor: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestActor,
        created_at: Time,
        period: Anthropic::Organization::SpendLimitPeriod,
        resolved_at: Time | nil,
        resolved_by: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestResolvedBy | nil,
        spend_summary: Anthropic::Organization::SpendSummary | nil,
        status: Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus,
        type: Symbol
      }
    end
  end
end
