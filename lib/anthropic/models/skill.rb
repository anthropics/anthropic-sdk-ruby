# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Skills#create
    class Skill < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the skill.
      #
      #   The format and length of IDs may change over time.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   ISO 8601 timestamp of when the skill was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute display_name
      #   Human-readable, single-line label for the Skill. Maximum 255 characters. Always
      #   set: derived from the SKILL.md frontmatter `name` when omitted at creation. Not
      #   unique.
      #
      #   @return [String]
      required :display_name, String

      # @!attribute latest_version_id
      #   ID of the newest Skill Version — what `latest` references resolve to. Always
      #   set: a Skill holds at least one version.
      #
      #   @return [String]
      required :latest_version_id, String

      # @!attribute source
      #   Where the Skill comes from.
      #
      #   Possible values:
      #
      #   - `"custom"`: authored by the platform user; private to their workspace
      #   - `"anthropic"`: published by Anthropic; shared and read-only
      #   - `"anthropic_example"`: Anthropic-published sample Skill
      #   - `"plugin"`: resolved from an installed plugin
      #
      #   @return [Anthropic::Models::SkillSource]
      required :source, -> { Anthropic::SkillSource }

      # @!attribute type
      #   Object type.
      #
      #   For Skills, this is always `"skill"`.
      #
      #   @return [Symbol, :skill]
      required :type, const: :skill

      # @!attribute updated_at
      #   ISO 8601 timestamp of when the skill was last updated.
      #
      #   @return [Time]
      required :updated_at, Time

      # @!method initialize(id:, created_at:, display_name:, latest_version_id:, source:, updated_at:, type: :skill)
      #   Some parameter documentations has been truncated, see {Anthropic::Models::Skill}
      #   for more details.
      #
      #   @param id [String] Unique identifier for the skill.
      #
      #   @param created_at [Time] ISO 8601 timestamp of when the skill was created.
      #
      #   @param display_name [String] Human-readable, single-line label for the Skill. Maximum 255 characters.
      #
      #   @param latest_version_id [String] ID of the newest Skill Version — what `latest` references resolve to. Always set
      #
      #   @param source [Anthropic::Models::SkillSource] Where the Skill comes from.
      #
      #   @param updated_at [Time] ISO 8601 timestamp of when the skill was last updated.
      #
      #   @param type [Symbol, :skill] Object type.
    end
  end
end
