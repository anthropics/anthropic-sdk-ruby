# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::BaseModel
      # @!attribute [rw] message
      #   @return [Anthropic::Models::Message]
      required :message, -> { Anthropic::Models::Message }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawMessageStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawMessageStartEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_START = :message_start
      end

      # @!parse
      #   # Create a new instance of RawMessageStartEvent from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :message
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
