# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Skills#delete
      class SkillDeleteResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the skill.
        #
        #   The format and length of IDs may change over time.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #   Deleted object type.
        #
        #   For Skills, this is always `"skill_deleted"`.
        #
        #   @return [String]
        required :type, String

        # @!method initialize(id:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SkillDeleteResponse} for more details.
        #
        #   @param id [String] Unique identifier for the skill.
        #
        #   @param type [String] Deleted object type.
      end
    end
  end
end
