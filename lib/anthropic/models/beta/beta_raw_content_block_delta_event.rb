# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute delta
        #
        #   @return [Anthropic::Beta::BetaTextDelta, Anthropic::Beta::BetaInputJSONDelta, Anthropic::Beta::BetaCitationsDelta, Anthropic::Beta::BetaThinkingDelta, Anthropic::Beta::BetaSignatureDelta]
        required :delta, union: -> { Anthropic::Beta::BetaRawContentBlockDelta }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_delta]
        required :type, const: :content_block_delta

        # @!method initialize(delta:, index:, type: :content_block_delta)
        #   @param delta [Anthropic::Beta::BetaTextDelta, Anthropic::Beta::BetaInputJSONDelta, Anthropic::Beta::BetaCitationsDelta, Anthropic::Beta::BetaThinkingDelta, Anthropic::Beta::BetaSignatureDelta]
        #   @param index [Integer]
        #   @param type [Symbol, :content_block_delta]
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
