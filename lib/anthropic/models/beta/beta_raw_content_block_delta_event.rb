# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # beta_raw_content_block_delta_event => {
      #   delta: union: Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta,
      #   index: Integer,
      #   type: enum: Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type
      # }
      # ```
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        # @!attribute delta
        #
        #   @return [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta]
        required :delta, union: -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type }

        # @!parse
        #   # @param delta [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta]
        #   # @param index [Integer]
        #   # @param type [String]
        #   #
        #   def initialize(delta:, index:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case delta
        # in Anthropic::Models::Beta::BetaTextDelta
        #   # ...
        # in Anthropic::Models::Beta::BetaInputJSONDelta
        #   # ...
        # end
        # ```
        class Delta < Anthropic::Union
          variant -> { Anthropic::Models::Beta::BetaTextDelta }

          variant -> { Anthropic::Models::Beta::BetaInputJSONDelta }
        end

        # @example
        #
        # ```ruby
        # case type
        # in :content_block_delta
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          CONTENT_BLOCK_DELTA = :content_block_delta

          finalize!
        end
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
