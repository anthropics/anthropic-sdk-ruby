# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::RateLimitsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.rate_limits.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaOrganizationRateLimit
    end

    assert_pattern do
      row => {
        id: String,
        group_type: Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType,
        limits: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaOrganizationRateLimitValue]),
        models: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        type: Symbol
      }
    end
  end
end
