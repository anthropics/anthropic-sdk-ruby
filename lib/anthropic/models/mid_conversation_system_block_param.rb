# frozen_string_literal: true

module Anthropic
  module Models
    class MidConversationSystemBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #   System instruction text blocks.
      #
      #   @return [Array<Anthropic::Models::TextBlockParam>]
      required :content, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::TextBlockParam] }

      # @!attribute type
      #
      #   @return [Symbol, :mid_conv_system]
      required :type, const: :mid_conv_system

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(content:, cache_control: nil, type: :mid_conv_system)
      #   System instructions that appear mid-conversation.
      #
      #   Use this block to provide or update system-level instructions at a specific
      #   point in the conversation, rather than only via the top-level `system`
      #   parameter.
      #
      #   @param content [Array<Anthropic::Models::TextBlockParam>] System instruction text blocks.
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :mid_conv_system]
    end
  end
end
