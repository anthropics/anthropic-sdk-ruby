# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::SkillsTest < Anthropic::Test::ResourceTest
  def test_create
    skip("prism binary unsupported")

    response = @anthropic.beta.skills.create

    assert_pattern do
      response => Anthropic::Models::Beta::SkillCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        display_title: String | nil,
        latest_version: String | nil,
        source: String,
        type: String,
        updated_at: String
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.skills.retrieve("skill_id")

    assert_pattern do
      response => Anthropic::Models::Beta::SkillRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        display_title: String | nil,
        latest_version: String | nil,
        source: String,
        type: String,
        updated_at: String
      }
    end
  end

  def test_list
    response = @anthropic.beta.skills.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Models::Beta::SkillListResponse
    end

    assert_pattern do
      row => {
        id: String,
        created_at: String,
        display_title: String | nil,
        latest_version: String | nil,
        source: String,
        type: String,
        updated_at: String
      }
    end
  end

  def test_delete
    response = @anthropic.beta.skills.delete("skill_id")

    assert_pattern do
      response => Anthropic::Models::Beta::SkillDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: String
      }
    end
  end
end
