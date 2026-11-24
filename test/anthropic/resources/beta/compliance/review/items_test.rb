# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Compliance::Review::ItemsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.compliance.review.items.retrieve(
        "item_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Compliance::Review::BetaComplianceReviewItem
    end

    assert_pattern do
      response => {
        id: String,
        actor: Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor | nil,
        content_expires_at: Time,
        created_at: Time,
        details: Anthropic::Beta::Compliance::Review::BetaComplianceReviewMessageDetails,
        organization_id: String,
        read_reason: Anthropic::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason,
        type: Symbol,
        user_profile_id: String | nil,
        workspace_id: String | nil
      }
    end
  end
end
