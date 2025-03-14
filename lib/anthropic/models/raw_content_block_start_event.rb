# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::BaseModel
      # @!attribute content_block
      #
      #   @return [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock]
      required :content_block, union: -> { Anthropic::Models::RawContentBlockStartEvent::ContentBlock }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_start]
      required :type, const: :content_block_start

      # @!parse
      #   # @param content_block [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock]
      #   # @param index [Integer]
      #   # @param type [Symbol, :content_block_start]
      #   #
      #   def initialize(content_block:, index:, type: :content_block_start, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @abstract
      class ContentBlock < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::TextBlock }

        variant :tool_use, -> { Anthropic::Models::ToolUseBlock }

        variant :thinking, -> { Anthropic::Models::ThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::Models::RedactedThinkingBlock }

        # @!parse
        #   class << self
        #     # @return [Array(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock)]
        #     def variants; end
        #   end
      end
    end
  end
end
