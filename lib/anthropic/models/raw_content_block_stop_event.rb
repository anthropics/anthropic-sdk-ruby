# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStopEvent < Anthropic::BaseModel
      # @!attribute index
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #   @return [Symbol, Anthropic::Models::RawContentBlockStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockStopEvent::Type }

      class Type < Anthropic::Enum
        CONTENT_BLOCK_STOP = :content_block_stop
      end

      # @!parse
      #   # Create a new instance of RawContentBlockStopEvent from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :index
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
