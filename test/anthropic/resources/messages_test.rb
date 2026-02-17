# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::MessagesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-opus-4-6"
      )

    assert_pattern do
      response => Anthropic::Message
    end

    assert_pattern do
      response => {
        id: String,
        container: Anthropic::Container | nil,
        content: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::ContentBlock]),
        model: Anthropic::Model,
        role: Symbol,
        stop_reason: Anthropic::StopReason | nil,
        stop_sequence: String | nil,
        type: Symbol,
        usage: Anthropic::Usage
      }
    end
  end

  def test_count_tokens_required_params
    response =
      @anthropic.messages.count_tokens(
        messages: [{content: "string", role: :user}],
        model: :"claude-opus-4-6"
      )

    assert_pattern do
      response => Anthropic::MessageTokensCount
    end

    assert_pattern do
      response => {
        input_tokens: Integer
      }
    end
  end
end
