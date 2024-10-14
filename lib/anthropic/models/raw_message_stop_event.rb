# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStopEvent < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawMessageStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawMessageStopEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_STOP = :message_stop
      end

      # Create a new instance of RawMessageStopEvent from a Hash of raw data.
      #
      # @overload initialize(type: nil)
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
