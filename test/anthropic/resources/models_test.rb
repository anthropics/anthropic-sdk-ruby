# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::ModelsTest < Minitest::Test
  def setup
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_retrieve
    response = @anthropic.models.retrieve("model_id")

    assert_pattern do
      response => Anthropic::Models::ModelInfo
    end
  end

  def test_list
    response = @anthropic.models.list

    assert_pattern do
      response => Anthropic::Page
    end

    page = response.next_page
    assert_pattern do
      page => Anthropic::Page
    end
  end
end
