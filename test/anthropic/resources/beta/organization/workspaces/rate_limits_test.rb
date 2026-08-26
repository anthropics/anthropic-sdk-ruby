# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Workspaces::RateLimitsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.workspaces.rate_limits.list("workspace_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit
    end

    assert_pattern do
      row => {
        group_type: Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType,
        limits: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue]),
        models: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        rate_limit_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end
end
