# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        # @!attribute delta
        #
        #   @return [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta]
        required :delta, union: -> { Anthropic::Models::Beta::BetaRawContentBlockDelta }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_delta]
        required :type, const: :content_block_delta

        # @!parse
        #   # @param delta [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta]
        #   # @param index [Integer]
        #   # @param type [Symbol, :content_block_delta]
        #   #
        #   def initialize(delta:, index:, type: :content_block_delta, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
