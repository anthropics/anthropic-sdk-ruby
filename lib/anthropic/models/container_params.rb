# frozen_string_literal: true

module Anthropic
  module Models
    class ContainerParams < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   Container id
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute skills
      #   List of skills to load in the container
      #
      #   @return [Array<Anthropic::Models::SkillParams>, nil]
      optional :skills, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::SkillParams] }, nil?: true

      # @!method initialize(id: nil, skills: nil)
      #   Container parameters with skills to be loaded.
      #
      #   @param id [String, nil] Container id
      #
      #   @param skills [Array<Anthropic::Models::SkillParams>, nil] List of skills to load in the container
    end
  end
end
