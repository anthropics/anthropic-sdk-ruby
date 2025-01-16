# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_content_block_start_event => {
      #   content_block: union: Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock,
      #   index: Integer,
      #   type: enum: Anthropic::Models::Beta::BetaRawContentBlockStartEvent::Type
      # }
      # ```
      class BetaRawContentBlockStartEvent < Anthropic::BaseModel
        # @!attribute content_block
        #
        #   @return [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock]
        required :content_block,
                 union: -> { Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawContentBlockStartEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawContentBlockStartEvent::Type }

        # @!parse
        #   # @param content_block [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock]
        #   # @param index [Integer]
        #   # @param type [String]
        #   #
        #   def initialize(content_block:, index:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case content_block
        # in {type: "text", text: String, type: enum: Anthropic::Models::Beta::BetaTextBlock::Type}
        #   # Anthropic::Models::Beta::BetaTextBlock ...
        # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
        #   # Anthropic::Models::Beta::BetaToolUseBlock ...
        # end
        # ```
        #
        # @example
        # ```ruby
        # case content_block
        # in Anthropic::Models::Beta::BetaTextBlock
        #   # ...
        # in Anthropic::Models::Beta::BetaToolUseBlock
        #   # ...
        # end
        # ```
        class ContentBlock < Anthropic::Union
          discriminator :type

          variant :text, -> { Anthropic::Models::Beta::BetaTextBlock }

          variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlock }
        end

        # @example
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

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
