# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::MessagesTest < Minitest::Test
  def setup
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_create_required_params
    response = @anthropic.beta.messages.create(
      max_tokens: 1024,
      messages: [{"content" => "Hello, world", "role" => "user"}],
      model: "claude-3-5-sonnet-20241022"
    )
    assert_kind_of(Anthropic::Models::Beta::BetaMessage, response)
  end

  def test_count_tokens_required_params
    response = @anthropic.beta.messages.count_tokens(
      messages: [{"content" => "string", "role" => "user"}],
      model: "string"
    )
    assert_kind_of(Anthropic::Models::Beta::BetaMessageTokensCount, response)
  end
end
