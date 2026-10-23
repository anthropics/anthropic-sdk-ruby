# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels#update
          class SlackChannelUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute id
            #   The channel's identifier, starting with `slch_`.
            #
            #   @return [String]
            required :id, String

            # @!attribute settings
            #   The settings to change.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsUpdate]
            required :settings, -> { Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate }

            # @!attribute betas
            #   This endpoint is in beta: requests must send
            #   `experimental-claude-tag-2026-10-21` in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(id:, settings:, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelUpdateParams} for
            #   more details.
            #
            #   @param id [String] The channel's identifier, starting with `slch_`.
            #
            #   @param settings [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsUpdate] The settings to change.
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `experimental-claude-tag-2026-10-21
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
