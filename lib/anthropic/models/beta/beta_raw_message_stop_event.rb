# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawMessageStopEvent < Anthropic::BaseModel
        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawMessageStopEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawMessageStopEvent::Type }

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

    BetaRawMessageStopEvent = Beta::BetaRawMessageStopEvent
  end
end
