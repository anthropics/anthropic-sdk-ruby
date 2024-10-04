# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStopEvent < BaseModel
      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawContentBlockStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockStopEvent::Type }

      class Type < Anthropic::Enum
        CONTENT_BLOCK_STOP = :content_block_stop
      end
    end
  end
end
