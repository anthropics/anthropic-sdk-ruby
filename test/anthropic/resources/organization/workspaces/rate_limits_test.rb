# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Organization::Workspaces::RateLimitsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.organization.workspaces.rate_limits.list("workspace_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::Workspaces::WorkspaceRateLimit
    end

    assert_pattern do
      row => {
        group: Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group,
        limits: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Organization::Workspaces::WorkspaceRateLimitValue]),
        models: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        rate_limit_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end
end
