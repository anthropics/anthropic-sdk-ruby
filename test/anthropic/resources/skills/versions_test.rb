# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Skills::VersionsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.skills.versions.create("skill_id", files: [StringIO.new("Example data")])

    assert_pattern do
      response => Anthropic::Skills::SkillVersion
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
    response = @anthropic.skills.versions.retrieve("version", skill_id: "skill_id")

    assert_pattern do
      response => Anthropic::Skills::SkillVersion
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
    response = @anthropic.skills.versions.list("skill_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Skills::SkillVersion
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
    response = @anthropic.skills.versions.delete("version", skill_id: "skill_id")

    assert_pattern do
      response => Anthropic::Skills::DeletedSkillVersion
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end
