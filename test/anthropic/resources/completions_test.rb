# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::CompletionsTest < Minitest::Test
  parallelize_me!

  def setup
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_create_required_params
    response = @anthropic.completions.create(
      {max_tokens_to_sample: 256, model: "string", prompt: "\n\nHuman: Hello, world!\n\nAssistant:"}
    )
    assert_kind_of(Anthropic::Models::Completion, response)
  end
end
