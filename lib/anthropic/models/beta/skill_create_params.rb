# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Skills#create
      class SkillCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute files
        #   Files to upload for the skill.
        #
        #   All files must be in the same top-level directory and must include a SKILL.md
        #   file at the root of that directory.
        #
        #   @return [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>]
        required :files, Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::FileInput]

        # @!attribute display_name
        #   Human-readable, single-line label for the Skill. Maximum 255 characters. Always
        #   set: derived from the SKILL.md frontmatter `name` when omitted at creation. Not
        #   unique.
        #
        #   @return [String, nil]
        optional :display_name, String, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(files:, display_name: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SkillCreateParams} for more details.
        #
        #   @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] Files to upload for the skill.
        #
        #   @param display_name [String, nil] Human-readable, single-line label for the Skill. Maximum 255 characters.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
