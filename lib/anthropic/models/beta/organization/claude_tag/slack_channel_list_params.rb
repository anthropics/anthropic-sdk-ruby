# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels#list
          class SlackChannelListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute slack_workspace_id
            #   The Slack workspace whose channels to list: Slack's identifier for it, as in the
            #   channel object's `slack.workspace_id`, not the workspace object's `id`.
            #
            #   @return [String]
            required :slack_workspace_id, String

            # @!attribute include_inherited
            #   When `true`, `settings` holds what applies in each channel once the settings
            #   levels above it are taken into account, and every member of `sources` names the
            #   level a value comes from. When `false` or left out, `settings` holds what each
            #   channel itself stores.
            #
            #   @return [Boolean, nil]
            optional :include_inherited, Anthropic::Internal::Type::Boolean

            # @!attribute limit
            #   Number of items to return per page, between 1 and 100. Defaults to 20.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`.
            #
            #   @return [String, nil]
            optional :page, String

            # @!attribute slack_channel_id
            #   Slack's identifier for one channel of that workspace, as in the channel object's
            #   `slack.channel_id`. It is not the channel object's `id`. With it `data` holds
            #   that channel alone, or nothing when the channel is not set up.
            #
            #   @return [String, nil]
            optional :slack_channel_id, String

            # @!attribute betas
            #   This endpoint is in beta: requests must send
            #   `experimental-claude-tag-2026-10-21` in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(slack_workspace_id:, include_inherited: nil, limit: nil, page: nil, slack_channel_id: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelListParams} for
            #   more details.
            #
            #   @param slack_workspace_id [String] The Slack workspace whose channels to list: Slack's identifier for it, as in the
            #
            #   @param include_inherited [Boolean] When `true`, `settings` holds what applies in each channel once the settings lev
            #
            #   @param limit [Integer] Number of items to return per page, between 1 and 100. Defaults to 20.
            #
            #   @param page [String] Opaque cursor from a previous response's `next_page`.
            #
            #   @param slack_channel_id [String] Slack's identifier for one channel of that workspace, as in the channel object's
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
