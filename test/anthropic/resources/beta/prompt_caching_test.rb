# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::PromptCachingTest < Test::Unit::TestCase
  def setup
    @anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
  end
end
