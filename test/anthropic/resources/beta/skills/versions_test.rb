# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Skills::VersionsTest < Anthropic::Test::ResourceTest
  def test_create
    skip("prism binary unsupported")

    response = @anthropic.beta.skills.versions.create("skill_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Skills::VersionCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        description: String,
        directory: String,
        name: String,
        skill_id: String,
        type: String,
        version: String
      }
    end
  end

  def test_retrieve_required_params
    response = @anthropic.beta.skills.versions.retrieve("version", skill_id: "skill_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Skills::VersionRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        description: String,
        directory: String,
        name: String,
        skill_id: String,
        type: String,
        version: String
      }
    end
  end

  def test_list
    response = @anthropic.beta.skills.versions.list("skill_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Models::Beta::Skills::VersionListResponse
    end

    assert_pattern do
      row => {
        id: String,
        created_at: String,
        description: String,
        directory: String,
        name: String,
        skill_id: String,
        type: String,
        version: String
      }
    end
  end

  def test_delete_required_params
    response = @anthropic.beta.skills.versions.delete("version", skill_id: "skill_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Skills::VersionDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: String
      }
    end
  end
end
