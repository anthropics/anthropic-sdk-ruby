# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ClaudeTag::SlackWorkspacesTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.organization.claude_tag.slack_workspaces.retrieve(
        "slws_01Hq8TzW5mKc2YbX7vNd4RfJ",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        settings: Anthropic::Beta::Organization::BetaClaudeTagSettings,
        slack: Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers,
        sources: Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.claude_tag.slack_workspaces.update(
        "slws_01Hq8TzW5mKc2YbX7vNd4RfJ",
        settings: {},
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        settings: Anthropic::Beta::Organization::BetaClaudeTagSettings,
        slack: Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers,
        sources: Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response =
      @anthropic.beta.organization.claude_tag.slack_workspaces.list(
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        settings: Anthropic::Beta::Organization::BetaClaudeTagSettings,
        slack: Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers,
        sources: Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
        type: Symbol,
        updated_at: Time
      }
    end
  end
end
