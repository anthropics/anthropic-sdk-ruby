# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::BaseModel
        # @!attribute content_block
        #
        #   @return [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock]
        required :content_block,
                 union: -> { Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_start]
        required :type, const: :content_block_start

        # @!parse
        #   # @param content_block [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock]
        #   # @param index [Integer]
        #   # @param type [Symbol, :content_block_start]
        #   #
        #   def initialize(content_block:, index:, type: :content_block_start, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @abstract
        class ContentBlock < Anthropic::Union
          discriminator :type

          variant :text, -> { Anthropic::Models::Beta::BetaTextBlock }

          variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlock }

          variant :thinking, -> { Anthropic::Models::Beta::BetaThinkingBlock }

          variant :redacted_thinking, -> { Anthropic::Models::Beta::BetaRedactedThinkingBlock }
        end
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
