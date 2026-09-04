# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Skills#delete
    class SkillDeleteParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute skill_id
      #   Unique identifier for the skill.
      #
      #   The format and length of IDs may change over time.
      #
      #   @return [String]
      required :skill_id, String

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!method initialize(skill_id:, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::SkillDeleteParams} for more details.
      #
      #   @param skill_id [String] Unique identifier for the skill.
      #
      #   @param workspace_id [String]
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
