# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::ModelsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.models.retrieve("model_id")

    assert_pattern do
      response => Anthropic::Models::ModelInfo
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.models.list

    assert_pattern do
      response => Anthropic::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Models::ModelInfo
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        display_name: String,
        type: Symbol
      }
    end
  end
end
