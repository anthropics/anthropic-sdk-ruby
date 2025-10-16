# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Skills
        # @see Anthropic::Resources::Beta::Skills::Versions#delete
        class VersionDeleteResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Version identifier for the skill.
          #
          #   Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Deleted object type.
          #
          #   For Skill Versions, this is always `"skill_version_deleted"`.
          #
          #   @return [String]
          required :type, String

          # @!method initialize(id:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Skills::VersionDeleteResponse} for more details.
          #
          #   @param id [String] Version identifier for the skill.
          #
          #   @param type [String] Deleted object type.
        end
      end
    end
  end
end
