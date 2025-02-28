# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::MessagesTest < Anthropic::Test::ResourceTest
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
