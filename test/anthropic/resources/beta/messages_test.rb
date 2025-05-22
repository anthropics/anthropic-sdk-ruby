# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::MessagesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )

    assert_pattern do
      response => Anthropic::Beta::BetaMessage
    end

    assert_pattern do
      response => {
        id: String,
        container: Anthropic::Beta::BetaContainer | nil,
        content: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaContentBlock]),
        model: Anthropic::Model,
        role: Symbol,
        stop_reason: Anthropic::Beta::BetaStopReason | nil,
        stop_sequence: String | nil,
        type: Symbol,
        usage: Anthropic::Beta::BetaUsage
      }
    end
  end

  def test_count_tokens_required_params
    response =
      @anthropic.beta.messages.count_tokens(
        messages: [{content: "string", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )

    assert_pattern do
      response => Anthropic::Beta::BetaMessageTokensCount
    end

    assert_pattern do
      response => {
        input_tokens: Integer
      }
    end
  end
end
