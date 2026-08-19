# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Skills#delete
    class DeletedSkill < Anthropic::Internal::Type::BaseModel
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
      #   @return [Symbol, :skill_deleted]
      required :type, const: :skill_deleted

      # @!method initialize(id:, type: :skill_deleted)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::DeletedSkill} for more details.
      #
      #   @param id [String] Unique identifier for the skill.
      #
      #   @param type [Symbol, :skill_deleted] Deleted object type.
    end
  end
end
