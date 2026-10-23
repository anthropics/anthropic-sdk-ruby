# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ClaudeTag::SlackChannelsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.claude_tag.slack_channels.create(
        slack: {channel_id: "xx", workspace_id: "xx"},
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        settings: Anthropic::Beta::Organization::BetaClaudeTagSettings,
        slack: Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
        sources: Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_retrieve
    response =
      @anthropic.beta.organization.claude_tag.slack_channels.retrieve(
        "slch_01SvpyRQK3nN6eH9uhRA7n1q",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        settings: Anthropic::Beta::Organization::BetaClaudeTagSettings,
        slack: Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
        sources: Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.claude_tag.slack_channels.update(
        "slch_01SvpyRQK3nN6eH9uhRA7n1q",
        settings: {},
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        settings: Anthropic::Beta::Organization::BetaClaudeTagSettings,
        slack: Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
        sources: Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list_required_params
    response =
      @anthropic.beta.organization.claude_tag.slack_channels.list(
        slack_workspace_id: "slack_workspace_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        settings: Anthropic::Beta::Organization::BetaClaudeTagSettings,
        slack: Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
        sources: Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response =
      @anthropic.beta.organization.claude_tag.slack_channels.delete(
        "slch_01SvpyRQK3nN6eH9uhRA7n1q",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagDeletedSlackChannel
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end
