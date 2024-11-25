# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawMessageStartEvent < Anthropic::BaseModel
        # @!attribute [rw] message
        #   @return [Anthropic::Models::Beta::BetaMessage]
        required :message, -> { Anthropic::Models::Beta::BetaMessage }

        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawMessageStartEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawMessageStartEvent::Type }

        class Type < Anthropic::Enum
          MESSAGE_START = :message_start
        end

        # @!parse
        #   # Create a new instance of BetaRawMessageStartEvent from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Object] :message
        #   #   @option data [String] :type
        #   def initialize(data = {}) = super
      end
    end

    BetaRawMessageStartEvent = Beta::BetaRawMessageStartEvent
  end
end
