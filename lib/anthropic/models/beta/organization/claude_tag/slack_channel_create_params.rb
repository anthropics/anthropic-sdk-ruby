# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels#create
          class SlackChannelCreateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute slack
            #   Slack's own identifiers for the channel to set up. The organization must own the
            #   workspace.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers]
            required :slack, -> { Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers }

            # @!attribute settings
            #   Settings to store on the channel, applied as Update Slack Channel applies them.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsCreate, nil]
            optional :settings, -> { Anthropic::Beta::Organization::BetaClaudeTagSettingsCreate }

            # @!attribute betas
            #   This endpoint is in beta: requests must send
            #   `experimental-claude-tag-2026-10-21` in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(slack:, settings: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelCreateParams} for
            #   more details.
            #
            #   @param slack [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers] Slack's own identifiers for the channel to set up. The organization must own the
            #
            #   @param settings [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsCreate] Settings to store on the channel, applied as Update Slack Channel applies them.
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
