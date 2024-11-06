# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRawMessageStopEvent < Anthropic::BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRawMessageStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::BetaRawMessageStopEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_STOP = :message_stop
      end

      # @!parse
      #   # Create a new instance of BetaRawMessageStopEvent from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
