# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute content_block
        #
        #   @return [Anthropic::Beta::BetaTextBlock, Anthropic::Beta::BetaToolUseBlock, Anthropic::Beta::BetaServerToolUseBlock, Anthropic::Beta::BetaWebSearchToolResultBlock, Anthropic::Beta::BetaThinkingBlock, Anthropic::Beta::BetaRedactedThinkingBlock]
        required :content_block, union: -> { Anthropic::Beta::BetaRawContentBlockStartEvent::ContentBlock }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_start]
        required :type, const: :content_block_start

        # @!method initialize(content_block:, index:, type: :content_block_start)
        #   @param content_block [Anthropic::Beta::BetaTextBlock, Anthropic::Beta::BetaToolUseBlock, Anthropic::Beta::BetaServerToolUseBlock, Anthropic::Beta::BetaWebSearchToolResultBlock, Anthropic::Beta::BetaThinkingBlock, Anthropic::Beta::BetaRedactedThinkingBlock]
        #   @param index [Integer]
        #   @param type [Symbol, :content_block_start]

        # @see Anthropic::Beta::BetaRawContentBlockStartEvent#content_block
        module ContentBlock
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :text, -> { Anthropic::Beta::BetaTextBlock }

          variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlock }

          variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlock }

          variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlock }

          variant :thinking, -> { Anthropic::Beta::BetaThinkingBlock }

          variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Beta::BetaTextBlock, Anthropic::Beta::BetaToolUseBlock, Anthropic::Beta::BetaServerToolUseBlock, Anthropic::Beta::BetaWebSearchToolResultBlock, Anthropic::Beta::BetaThinkingBlock, Anthropic::Beta::BetaRedactedThinkingBlock)]

          define_sorbet_constant!(:Variants) do
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaTextBlock,
                Anthropic::Beta::BetaToolUseBlock,
                Anthropic::Beta::BetaServerToolUseBlock,
                Anthropic::Beta::BetaWebSearchToolResultBlock,
                Anthropic::Beta::BetaThinkingBlock,
                Anthropic::Beta::BetaRedactedThinkingBlock
              )
            end
          end
        end
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
