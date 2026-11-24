# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Compliance::Review::CasesTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.compliance.review.cases.retrieve(
        "case_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enforcement_action: Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction | nil,
        organization_id: String,
        policy_categories: ^(Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory]),
        status: Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus,
        transcripts: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript]),
        type: Symbol,
        updated_at: Time,
        workspace_id: String | nil
      }
    end
  end

  def test_list
    response = @anthropic.beta.compliance.review.cases.list(request_options: {extra_query: {beta: "true"}})

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        enforcement_action: Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction | nil,
        organization_id: String,
        policy_categories: ^(Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory]),
        status: Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus,
        transcripts: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript]),
        type: Symbol,
        updated_at: Time,
        workspace_id: String | nil
      }
    end
  end

  def test_respond_required_params
    response =
      @anthropic.beta.compliance.review.cases.respond(
        "case_id",
        determination: :no_violation,
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enforcement_action: Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction | nil,
        organization_id: String,
        policy_categories: ^(Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory]),
        status: Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus,
        transcripts: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript]),
        type: Symbol,
        updated_at: Time,
        workspace_id: String | nil
      }
    end
  end
end
