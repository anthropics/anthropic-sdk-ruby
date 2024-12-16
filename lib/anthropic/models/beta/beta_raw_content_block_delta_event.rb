# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        # @!attribute delta
        #
        #   @return [Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaTextDelta]
        required :delta, Anthropic::Unknown

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type }

        # @!parse
        #   # @param delta [Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaTextDelta]
        #   # @param index [Integer]
        #   # @param type [String]
        #   #
        #   def initialize(delta:, index:, type:) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class Type < Anthropic::Enum
          CONTENT_BLOCK_DELTA = :content_block_delta
        end
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
