# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Organization::RateLimitsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.rate_limits.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::OrganizationRateLimit
    end

    assert_pattern do
      row => {
        id: String,
        group: Anthropic::Organization::OrganizationRateLimit::Group,
        limits: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Organization::OrganizationRateLimitValue]),
        models: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        type: Symbol
      }
    end
  end
end
