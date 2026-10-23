# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Workspaces::RateLimitsTest < Anthropic::Test::ResourceTest
  def test_update_required_params
    response =
      @anthropic.beta.organization.workspaces.rate_limits.update(
        "rate_limit_id",
        workspace_id: "workspace_id",
        limits: [{type: :fast_itpmca, value: 0}],
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit
    end

    assert_pattern do
      response => {
        group: Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group,
        limits: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue]),
        models: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        rate_limit_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end

  def test_list
    response =
      @anthropic.beta.organization.workspaces.rate_limits.list(
        "workspace_id",
        request_options: {extra_query: {beta: "true"}}
      )

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
        group: Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group,
        limits: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue]),
        models: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        rate_limit_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end
end
