# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::CompletionsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.completions.create(
      max_tokens_to_sample: 256,
      model: :"claude-3-7-sonnet-latest",
      prompt: "\n\nHuman: Hello, world!\n\nAssistant:",
      stream: true
    )

    assert_pattern do
      response => Anthropic::Models::Completion
    end

    assert_pattern do
      response => {
        id: String,
        completion: String,
        model: Anthropic::Models::Model,
        stop_reason: String | nil,
        type: Symbol
      }
    end
  end
end
