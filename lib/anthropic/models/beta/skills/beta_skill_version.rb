# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Skills
        # @see Anthropic::Resources::Beta::Skills::Versions#create
        class BetaSkillVersion < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this Skill Version. The id addresses the version in paths
          #   and pins it in references.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   ISO 8601 timestamp of when the skill was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute description
          #   Description of the skill version.
          #
          #   This is extracted from the SKILL.md file in the skill upload.
          #
          #   @return [String]
          required :description, String

          # @!attribute name
          #   The Skill's immutable kebab-case slug, set at creation from the first upload's
          #   SKILL.md frontmatter `name` (or its enclosing directory). Every later upload
          #   must resolve to the same value. Also the top-level directory of the Skill's
          #   mounted files and the base name of a downloaded archive.
          #
          #   @return [String]
          required :name, String

          # @!attribute skill_id
          #   Unique identifier for the skill.
          #
          #   The format and length of IDs may change over time.
          #
          #   @return [String]
          required :skill_id, String

          # @!attribute type
          #   Object type.
          #
          #   For Skill Versions, this is always `"skill_version"`.
          #
          #   @return [Symbol, :skill_version]
          required :type, const: :skill_version

          # @!method initialize(id:, created_at:, description:, name:, skill_id:, type: :skill_version)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Skills::BetaSkillVersion} for more details.
          #
          #   @param id [String] Unique identifier for this Skill Version. The id addresses the version in
          #
          #   @param created_at [Time] ISO 8601 timestamp of when the skill was created.
          #
          #   @param description [String] Description of the skill version.
          #
          #   @param name [String] The Skill's immutable kebab-case slug, set at creation from the first
          #
          #   @param skill_id [String] Unique identifier for the skill.
          #
          #   @param type [Symbol, :skill_version] Object type.
        end
      end
    end
  end
end
