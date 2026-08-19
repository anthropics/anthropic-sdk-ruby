# frozen_string_literal: true

module Anthropic
  module Models
    module Skills
      # @see Anthropic::Resources::Skills::Versions#delete
      class DeletedSkillVersion < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this Skill Version. The id addresses the version in paths
        #   and pins it in references.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #   Deleted object type.
        #
        #   For Skill Versions, this is always `"skill_version_deleted"`.
        #
        #   @return [Symbol, :skill_version_deleted]
        required :type, const: :skill_version_deleted

        # @!method initialize(id:, type: :skill_version_deleted)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Skills::DeletedSkillVersion} for more details.
        #
        #   @param id [String] Unique identifier for this Skill Version. The id addresses the version in
        #
        #   @param type [Symbol, :skill_version_deleted] Deleted object type.
      end
    end
  end
end
