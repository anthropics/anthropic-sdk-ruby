# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::SkillsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.skills.create(files: [StringIO.new("Example data")])

    assert_pattern do
      response => Anthropic::Skill
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        latest_version_id: String,
        source: Anthropic::SkillSource,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_retrieve
    response = @anthropic.skills.retrieve("skill_id")

    assert_pattern do
      response => Anthropic::Skill
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        latest_version_id: String,
        source: Anthropic::SkillSource,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response = @anthropic.skills.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Skill
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        display_name: String,
        latest_version_id: String,
        source: Anthropic::SkillSource,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @anthropic.skills.delete("skill_id")

    assert_pattern do
      response => Anthropic::DeletedSkill
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end
