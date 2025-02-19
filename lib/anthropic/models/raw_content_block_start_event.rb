# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # raw_content_block_start_event => {
    #   content_block: Anthropic::Models::RawContentBlockStartEvent::ContentBlock,
    #   index: Integer,
    #   type: :content_block_start
    # }
    # ```
    class RawContentBlockStartEvent < Anthropic::BaseModel
      # @!attribute content_block
      #
      #   @return [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock]
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
      #   # @param content_block [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock]
      #   # @param index [Integer]
      #   # @param type [Symbol, :content_block_start]
      #   #
      #   def initialize(content_block:, index:, type: :content_block_start, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @abstract
      #
      # @example
      # ```ruby
      # case content_block
      # in {
      #   type: "text",
      #   citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::TextCitation] === _1 },
      #   text: String
      # }
      #   # Anthropic::Models::TextBlock ...
      # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
      #   # Anthropic::Models::ToolUseBlock ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case content_block
      # in Anthropic::Models::TextBlock
      #   # ...
      # in Anthropic::Models::ToolUseBlock
      #   # ...
      # end
      # ```
      class ContentBlock < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::TextBlock }

        variant :tool_use, -> { Anthropic::Models::ToolUseBlock }
      end
    end
  end
end
