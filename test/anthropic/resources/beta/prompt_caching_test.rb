# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::PromptCachingTest < Minitest::Test
  parallelize_me!

  def setup
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end
end
