# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta]
      required :delta, union: -> { Anthropic::RawContentBlockDelta }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_delta]
      required :type, const: :content_block_delta

      # @!method initialize(delta:, index:, type: :content_block_delta)
      #   @param delta [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta]
      #   @param index [Integer]
      #   @param type [Symbol, :content_block_delta]
    end
  end
end
