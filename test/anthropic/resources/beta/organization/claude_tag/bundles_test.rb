# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ClaudeTag::BundlesTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.organization.claude_tag.bundles.retrieve(
        "capp_011CZkZjLP1cWxj5EtMmdgbq",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String | nil,
        display_name: String,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response =
      @anthropic.beta.organization.claude_tag.bundles.list(request_options: {extra_query: {beta: "true"}})

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        description: String | nil,
        display_name: String,
        type: Symbol,
        updated_at: Time
      }
    end
  end
end
