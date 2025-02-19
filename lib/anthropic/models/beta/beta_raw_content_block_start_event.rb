# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_content_block_start_event => {
      #   content_block: Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock,
      #   index: Integer,
      #   type: :content_block_start
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
        #   @return [Symbol, :content_block_start]
        required :type, const: :content_block_start

        # @!parse
        #   # @param content_block [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock]
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
        #   citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitation] === _1 },
        #   text: String
        # }
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
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
