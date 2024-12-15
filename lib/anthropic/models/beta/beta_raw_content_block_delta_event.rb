# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        # @!attribute delta
        #   @return [Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaTextDelta]
        required :delta, Anthropic::Unknown

        # @!attribute index
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type }

        class Type < Anthropic::Enum
          CONTENT_BLOCK_DELTA = :content_block_delta
        end

        # @!parse
        #   # Create a new instance of BetaRawContentBlockDeltaEvent from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Object] :delta
        #   #   @option data [Integer] :index
        #   #   @option data [String] :type
        #   def initialize(data = {}) = super
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
