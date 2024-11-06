# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStopEvent < Anthropic::BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawMessageStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawMessageStopEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_STOP = :message_stop
      end

      # @!parse
      #   # Create a new instance of RawMessageStopEvent from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
