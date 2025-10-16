# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Skills#retrieve
      class SkillRetrieveResponse < Anthropic::Internal::Type::BaseModel
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
        #   @return [String]
        required :created_at, String

        # @!attribute display_title
        #   Display title for the skill.
        #
        #   This is a human-readable label that is not included in the prompt sent to the
        #   model.
        #
        #   @return [String, nil]
        required :display_title, String, nil?: true

        # @!attribute latest_version
        #   The latest version identifier for the skill.
        #
        #   This represents the most recent version of the skill that has been created.
        #
        #   @return [String, nil]
        required :latest_version, String, nil?: true

        # @!attribute source
        #   Source of the skill.
        #
        #   This may be one of the following values:
        #
        #   - `"custom"`: the skill was created by a user
        #   - `"anthropic"`: the skill was created by Anthropic
        #
        #   @return [String]
        required :source, String

        # @!attribute type
        #   Object type.
        #
        #   For Skills, this is always `"skill"`.
        #
        #   @return [String]
        required :type, String

        # @!attribute updated_at
        #   ISO 8601 timestamp of when the skill was last updated.
        #
        #   @return [String]
        required :updated_at, String

        # @!method initialize(id:, created_at:, display_title:, latest_version:, source:, type:, updated_at:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SkillRetrieveResponse} for more details.
        #
        #   @param id [String] Unique identifier for the skill.
        #
        #   @param created_at [String] ISO 8601 timestamp of when the skill was created.
        #
        #   @param display_title [String, nil] Display title for the skill.
        #
        #   @param latest_version [String, nil] The latest version identifier for the skill.
        #
        #   @param source [String] Source of the skill.
        #
        #   @param type [String] Object type.
        #
        #   @param updated_at [String] ISO 8601 timestamp of when the skill was last updated.
      end
    end
  end
end
