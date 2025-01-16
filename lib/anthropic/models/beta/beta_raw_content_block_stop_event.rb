# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_content_block_stop_event => {
      #   index: Integer,
      #   type: enum: Anthropic::Models::Beta::BetaRawContentBlockStopEvent::Type
      # }
      # ```
      class BetaRawContentBlockStopEvent < Anthropic::BaseModel
        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawContentBlockStopEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawContentBlockStopEvent::Type }

        # @!parse
        #   # @param index [Integer]
        #   # @param type [String]
        #   #
        #   def initialize(index:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :content_block_stop
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          CONTENT_BLOCK_STOP = :content_block_stop

          finalize!
        end
      end
    end

    BetaRawContentBlockStopEvent = Beta::BetaRawContentBlockStopEvent
  end
end
