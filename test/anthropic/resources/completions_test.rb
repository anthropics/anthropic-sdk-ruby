# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::CompletionsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.completions.create(
        max_tokens_to_sample: 256,
        model: :"claude-opus-4-5-20251101",
        prompt: "\n\nHuman: Hello, world!\n\nAssistant:"
      )

    assert_pattern do
      response => Anthropic::Completion
    end

    assert_pattern do
      response => {
        id: String,
        completion: String,
        model: Anthropic::Model,
        stop_reason: String | nil,
        type: Symbol
      }
    end
  end
end
