# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute content_block
      #
      #   @return [Anthropic::TextBlock, Anthropic::ToolUseBlock, Anthropic::ServerToolUseBlock, Anthropic::WebSearchToolResultBlock, Anthropic::ThinkingBlock, Anthropic::RedactedThinkingBlock]
      required :content_block, union: -> { Anthropic::RawContentBlockStartEvent::ContentBlock }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_start]
      required :type, const: :content_block_start

      # @!method initialize(content_block:, index:, type: :content_block_start)
      #   @param content_block [Anthropic::TextBlock, Anthropic::ToolUseBlock, Anthropic::ServerToolUseBlock, Anthropic::WebSearchToolResultBlock, Anthropic::ThinkingBlock, Anthropic::RedactedThinkingBlock]
      #   @param index [Integer]
      #   @param type [Symbol, :content_block_start]

      # @see Anthropic::RawContentBlockStartEvent#content_block
      module ContentBlock
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::TextBlock }

        variant :tool_use, -> { Anthropic::ToolUseBlock }

        variant :server_tool_use, -> { Anthropic::ServerToolUseBlock }

        variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlock }

        variant :thinking, -> { Anthropic::ThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::TextBlock, Anthropic::ToolUseBlock, Anthropic::ServerToolUseBlock, Anthropic::WebSearchToolResultBlock, Anthropic::ThinkingBlock, Anthropic::RedactedThinkingBlock)]
      end
    end
  end
end
