# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Skills
        # @see Anthropic::Resources::Beta::Skills::Versions#delete
        class VersionDeleteParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute skill_id
          #   Unique identifier for the skill.
          #
          #   The format and length of IDs may change over time.
          #
          #   @return [String]
          required :skill_id, String

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(skill_id:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Skills::VersionDeleteParams} for more details.
          #
          #   @param skill_id [String] Unique identifier for the skill.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
