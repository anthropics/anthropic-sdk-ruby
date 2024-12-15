# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::BaseModel
        # @!attribute content_block
        #   @return [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock]
        required :content_block, Anthropic::Unknown

        # @!attribute index
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawContentBlockStartEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawContentBlockStartEvent::Type }

        class Type < Anthropic::Enum
          CONTENT_BLOCK_START = :content_block_start
        end

        # @!parse
        #   # Create a new instance of BetaRawContentBlockStartEvent from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Object] :content_block
        #   #   @option data [Integer] :index
        #   #   @option data [String] :type
        #   def initialize(data = {}) = super
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
