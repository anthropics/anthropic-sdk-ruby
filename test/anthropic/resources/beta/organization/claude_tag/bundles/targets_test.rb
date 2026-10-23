# frozen_string_literal: true

require_relative "../../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ClaudeTag::Bundles::TargetsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.claude_tag.bundles.targets.create(
        "capp_011CZkZjLP1cWxj5EtMmdgbq",
        target: {slack_channel_id: "xxxxxxxx", type: :slack_channel},
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget
    end

    assert_pattern do
      case response
      in Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget
      in Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget
      end
    end

    assert_pattern do
      case response
      in {type: :slack_channel, id: String, created_at: Time, slack_channel_id: String}
      in {type: :slack_workspace, id: String, created_at: Time, slack_workspace_id: String}
      end
    end
  end

  def test_retrieve_required_params
    response =
      @anthropic.beta.organization.claude_tag.bundles.targets.retrieve(
        "btgt_01SvpyRQK3nN6eH9uhRA7n1qHq8TzW5mKc2YbX7vNd4RfJ",
        bundle_id: "capp_011CZkZjLP1cWxj5EtMmdgbq",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget
    end

    assert_pattern do
      case response
      in Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget
      in Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget
      end
    end

    assert_pattern do
      case response
      in {type: :slack_channel, id: String, created_at: Time, slack_channel_id: String}
      in {type: :slack_workspace, id: String, created_at: Time, slack_workspace_id: String}
      end
    end
  end

  def test_list
    response =
      @anthropic.beta.organization.claude_tag.bundles.targets.list(
        "capp_011CZkZjLP1cWxj5EtMmdgbq",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget
    end

    assert_pattern do
      case row
      in Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget
      in Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget
      end
    end

    assert_pattern do
      case row
      in {type: :slack_channel, id: String, created_at: Time, slack_channel_id: String}
      in {type: :slack_workspace, id: String, created_at: Time, slack_workspace_id: String}
      end
    end
  end

  def test_delete_required_params
    response =
      @anthropic.beta.organization.claude_tag.bundles.targets.delete(
        "btgt_01SvpyRQK3nN6eH9uhRA7n1qHq8TzW5mKc2YbX7vNd4RfJ",
        bundle_id: "capp_011CZkZjLP1cWxj5EtMmdgbq",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagDeletedBundleTarget
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end
