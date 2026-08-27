# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Skills::VersionsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.skills.versions.create("skill_id", files: [StringIO.new("Example data")])

    assert_pattern do
      response => Anthropic::Beta::Skills::BetaSkillVersion
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String,
        name: String,
        skill_id: String,
        type: Symbol
      }
    end
  end

  def test_retrieve_required_params
    response = @anthropic.beta.skills.versions.retrieve("version", skill_id: "skill_id")

    assert_pattern do
      response => Anthropic::Beta::Skills::BetaSkillVersion
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String,
        name: String,
        skill_id: String,
        type: Symbol
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
      row => Anthropic::Beta::Skills::BetaSkillVersion
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        description: String,
        name: String,
        skill_id: String,
        type: Symbol
      }
    end
  end

  def test_delete_required_params
    response = @anthropic.beta.skills.versions.delete("version", skill_id: "skill_id")

    assert_pattern do
      response => Anthropic::Beta::Skills::BetaDeletedSkillVersion
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_download_required_params
    response = @anthropic.beta.skills.versions.download("version", skill_id: "skill_id")

    assert_pattern do
      response => StringIO
    end
  end
end
