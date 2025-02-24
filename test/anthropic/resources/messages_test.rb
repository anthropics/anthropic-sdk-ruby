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
      model: :"claude-3-7-sonnet-latest",
      stream: true
    )

    assert_pattern do
      response => Anthropic::Models::Message
    end

    assert_pattern do
      response => {
        id: String,
        content: ^(Anthropic::ArrayOf[union: Anthropic::Models::ContentBlock]),
        model: Anthropic::Models::Model,
        role: Symbol,
        stop_reason: Anthropic::Models::Message::StopReason | nil,
        stop_sequence: String | nil,
        type: Symbol,
        usage: Anthropic::Models::Usage
      }
    end
  end

  def test_count_tokens_required_params
    response = @anthropic.messages.count_tokens(
      messages: [{content: "string", role: :user}],
      model: :"claude-3-7-sonnet-latest"
    )

    assert_pattern do
      response => Anthropic::Models::MessageTokensCount
    end

    assert_pattern do
      response => {
        input_tokens: Integer
      }
    end
  end
end
