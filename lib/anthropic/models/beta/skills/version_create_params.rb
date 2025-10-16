# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Skills
        # @see Anthropic::Resources::Beta::Skills::Versions#create
        class VersionCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute files
          #   Files to upload for the skill.
          #
          #   All files must be in the same top-level directory and must include a SKILL.md
          #   file at the root of that directory.
          #
          #   @return [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>, nil]
          optional :files,
                   Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::FileInput],
                   nil?: true

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(files: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Skills::VersionCreateParams} for more details.
          #
          #   @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>, nil] Files to upload for the skill.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
