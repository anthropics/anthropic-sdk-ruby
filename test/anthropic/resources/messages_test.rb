# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::MessagesTest < Minitest::Test
  def before_all
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_create_required_params
    response = @anthropic.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-3-5-haiku-latest",
      stream: true
    )

    assert_pattern do
      response => Anthropic::Models::Message
    end
  end

  def test_count_tokens_required_params
    response = @anthropic.messages.count_tokens(
      messages: [{content: "string", role: :user}],
      model: :"claude-3-5-haiku-latest"
    )

    assert_pattern do
      response => Anthropic::Models::MessageTokensCount
    end
  end
end
