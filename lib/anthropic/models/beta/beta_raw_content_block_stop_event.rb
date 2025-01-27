# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_content_block_stop_event => {
      #   index: Integer,
      #   type: :content_block_stop
      # }
      # ```
      class BetaRawContentBlockStopEvent < Anthropic::BaseModel
        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_stop]
        required :type, const: :content_block_stop

        # @!parse
        #   # @param index [Integer]
        #   # @param type [Symbol, :content_block_stop]
        #   #
        #   def initialize(index:, type: :content_block_stop, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaRawContentBlockStopEvent = Beta::BetaRawContentBlockStopEvent
  end
end
