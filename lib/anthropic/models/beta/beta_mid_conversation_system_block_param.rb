# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMidConversationSystemBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   System instruction text blocks.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        required :content, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaTextBlockParam] }

        # @!attribute type
        #
        #   @return [Symbol, :mid_conv_system]
        required :type, const: :mid_conv_system

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, cache_control: nil, type: :mid_conv_system)
        #   System instructions that appear mid-conversation.
        #
        #   Use this block to provide or update system-level instructions at a specific
        #   point in the conversation, rather than only via the top-level `system`
        #   parameter.
        #
        #   @param content [Array<Anthropic::Models::Beta::BetaTextBlockParam>] System instruction text blocks.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :mid_conv_system]
      end
    end

    BetaMidConversationSystemBlockParam = Beta::BetaMidConversationSystemBlockParam
  end
end
