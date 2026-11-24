# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Compliance::Review::NoticesTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.compliance.review.notices.list(request_options: {extra_query: {beta: "true"}})

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Compliance::Review::BetaComplianceReviewNotice
    end

    assert_pattern do
      row => {
        id: String,
        case_ids: ^(Anthropic::Internal::Type::ArrayOf[String]),
        created_at: Time,
        kind: Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind,
        message: String,
        organization_id: String,
        respond_by: Time | nil,
        type: Symbol
      }
    end
  end
end
