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

        class BetaTextBlock < Anthropic::BaseModel
          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlock::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlock::Type }

          # @!parse
          #   # @param text [String]
          #   # @param type [String]
          #   #
          #   def initialize(text:, type:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          #
          # ```ruby
          # case enum
          # in :text
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            TEXT = :text

            finalize!
          end
        end

        class BetaToolUseBlock < Anthropic::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute input
          #
          #   @return [Object]
          required :input, Anthropic::Unknown

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaToolUseBlock::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaToolUseBlock::Type }

          # @!parse
          #   # @param id [String]
          #   # @param input [Object]
          #   # @param name [String]
          #   # @param type [String]
          #   #
          #   def initialize(id:, input:, name:, type:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          #
          # ```ruby
          # case enum
          # in :tool_use
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            TOOL_USE = :tool_use

            finalize!
          end
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
