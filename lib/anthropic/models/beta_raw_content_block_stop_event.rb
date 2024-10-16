# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRawContentBlockStopEvent < BaseModel
      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRawContentBlockStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::BetaRawContentBlockStopEvent::Type }

      class Type < Anthropic::Enum
        CONTENT_BLOCK_STOP = :content_block_stop
      end

      # @!parse
      #   # Create a new instance of BetaRawContentBlockStopEvent from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :index
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
