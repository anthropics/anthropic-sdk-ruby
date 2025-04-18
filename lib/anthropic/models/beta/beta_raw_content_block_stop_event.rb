# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStopEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_stop]
        required :type, const: :content_block_stop

        # @!method initialize(index:, type: :content_block_stop)
        #   @param index [Integer]
        #   @param type [Symbol, :content_block_stop]
      end
    end

    BetaRawContentBlockStopEvent = Beta::BetaRawContentBlockStopEvent
  end
end
