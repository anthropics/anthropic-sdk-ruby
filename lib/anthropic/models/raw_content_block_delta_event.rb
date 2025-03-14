# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta]
      required :delta, union: -> { Anthropic::Models::RawContentBlockDeltaEvent::Delta }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_delta]
      required :type, const: :content_block_delta

      # @!parse
      #   # @param delta [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta]
      #   # @param index [Integer]
      #   # @param type [Symbol, :content_block_delta]
      #   #
      #   def initialize(delta:, index:, type: :content_block_delta, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @abstract
      class Delta < Anthropic::Union
        discriminator :type

        variant :text_delta, -> { Anthropic::Models::TextDelta }

        variant :input_json_delta, -> { Anthropic::Models::InputJSONDelta }

        variant :citations_delta, -> { Anthropic::Models::CitationsDelta }

        variant :thinking_delta, -> { Anthropic::Models::ThinkingDelta }

        variant :signature_delta, -> { Anthropic::Models::SignatureDelta }

        # @!parse
        #   class << self
        #     # @return [Array(Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta)]
        #     def variants; end
        #   end
      end
    end
  end
end
