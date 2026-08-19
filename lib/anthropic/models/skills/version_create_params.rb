# frozen_string_literal: true

module Anthropic
  module Models
    module Skills
      # @see Anthropic::Resources::Skills::Versions#create
      class VersionCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute skill_id
        #   Unique identifier for the skill.
        #
        #   The format and length of IDs may change over time.
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute files
        #   Files to upload for the skill.
        #
        #   All files must be in the same top-level directory and must include a SKILL.md
        #   file at the root of that directory.
        #
        #   @return [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>]
        required :files, Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::FileInput]

        # @!method initialize(skill_id:, files:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Skills::VersionCreateParams} for more details.
        #
        #   @param skill_id [String] Unique identifier for the skill.
        #
        #   @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] Files to upload for the skill.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
