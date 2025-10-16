# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Skills
        # @see Anthropic::Resources::Beta::Skills::Versions#create
        class VersionCreateResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for the skill version.
          #
          #   The format and length of IDs may change over time.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   ISO 8601 timestamp of when the skill version was created.
          #
          #   @return [String]
          required :created_at, String

          # @!attribute description
          #   Description of the skill version.
          #
          #   This is extracted from the SKILL.md file in the skill upload.
          #
          #   @return [String]
          required :description, String

          # @!attribute directory
          #   Directory name of the skill version.
          #
          #   This is the top-level directory name that was extracted from the uploaded files.
          #
          #   @return [String]
          required :directory, String

          # @!attribute name
          #   Human-readable name of the skill version.
          #
          #   This is extracted from the SKILL.md file in the skill upload.
          #
          #   @return [String]
          required :name, String

          # @!attribute skill_id
          #   Identifier for the skill that this version belongs to.
          #
          #   @return [String]
          required :skill_id, String

          # @!attribute type
          #   Object type.
          #
          #   For Skill Versions, this is always `"skill_version"`.
          #
          #   @return [String]
          required :type, String

          # @!attribute version
          #   Version identifier for the skill.
          #
          #   Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
          #
          #   @return [String]
          required :version, String

          # @!method initialize(id:, created_at:, description:, directory:, name:, skill_id:, type:, version:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Skills::VersionCreateResponse} for more details.
          #
          #   @param id [String] Unique identifier for the skill version.
          #
          #   @param created_at [String] ISO 8601 timestamp of when the skill version was created.
          #
          #   @param description [String] Description of the skill version.
          #
          #   @param directory [String] Directory name of the skill version.
          #
          #   @param name [String] Human-readable name of the skill version.
          #
          #   @param skill_id [String] Identifier for the skill that this version belongs to.
          #
          #   @param type [String] Object type.
          #
          #   @param version [String] Version identifier for the skill.
        end
      end
    end
  end
end
