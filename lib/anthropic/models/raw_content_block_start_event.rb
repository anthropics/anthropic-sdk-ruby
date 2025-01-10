# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # raw_content_block_start_event => {
    #   content_block: Anthropic::Models::RawContentBlockStartEvent::ContentBlock,
    #   index: Integer,
    #   type: Anthropic::Models::RawContentBlockStartEvent::Type
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
      #   @return [Symbol, Anthropic::Models::RawContentBlockStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockStartEvent::Type }

      # @!parse
      #   # @param content_block [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock]
      #   # @param index [Integer]
      #   # @param type [String]
      #   #
      #   def initialize(content_block:, index:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case content_block
      # in {type: "text", text: String, type: Anthropic::Models::TextBlock::Type}
      #   # Anthropic::Models::TextBlock ...
      # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
      #   # Anthropic::Models::ToolUseBlock ...
      # end
      # ```
      #
      # @example
      #
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

      # @example
      #
      # ```ruby
      # case type
      # in :content_block_start
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        CONTENT_BLOCK_START = :content_block_start

        finalize!
      end
    end
  end
end
