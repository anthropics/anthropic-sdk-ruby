# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
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
        #
        # ```ruby
        # case union
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
        #
        # ```ruby
        # case enum
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
