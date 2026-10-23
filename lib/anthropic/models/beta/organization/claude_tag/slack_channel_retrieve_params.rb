# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels#retrieve
          class SlackChannelRetrieveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute id
            #   The channel's identifier, starting with `slch_`.
            #
            #   @return [String]
            required :id, String

            # @!attribute include_inherited
            #   When `true`, `settings` holds what applies in the channel once the settings
            #   levels above it are taken into account, and every member of `sources` names the
            #   level a value comes from. When `false` or left out, `settings` holds what the
            #   channel itself stores.
            #
            #   @return [Boolean, nil]
            optional :include_inherited, Anthropic::Internal::Type::Boolean

            # @!attribute betas
            #   This endpoint is in beta: requests must send
            #   `experimental-claude-tag-2026-10-21` in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(id:, include_inherited: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelRetrieveParams}
            #   for more details.
            #
            #   @param id [String] The channel's identifier, starting with `slch_`.
            #
            #   @param include_inherited [Boolean] When `true`, `settings` holds what applies in the channel once the settings leve
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
