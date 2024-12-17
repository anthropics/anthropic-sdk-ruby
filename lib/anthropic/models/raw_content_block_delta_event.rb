# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::InputJSONDelta, Anthropic::Models::TextDelta]
      required :delta, Anthropic::Unknown

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::RawContentBlockDeltaEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockDeltaEvent::Type }

      # @!parse
      #   # @param delta [Anthropic::Models::InputJSONDelta, Anthropic::Models::TextDelta]
      #   # @param index [Integer]
      #   # @param type [String]
      #   #
      #   def initialize(delta:, index:, type:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :content_block_delta
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        CONTENT_BLOCK_DELTA = :content_block_delta
      end
    end
  end
end
