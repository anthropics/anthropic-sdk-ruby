# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRawContentBlockStartEvent < BaseModel
      # @!attribute [rw] content_block
      #   @return [Anthropic::Models::BetaTextBlock, Anthropic::Models::BetaToolUseBlock]
      required :content_block, Anthropic::Unknown

      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRawContentBlockStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::BetaRawContentBlockStartEvent::Type }

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
end
