# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRawMessageStopEvent < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRawMessageStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::BetaRawMessageStopEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_STOP = :message_stop
      end

      # Create a new instance of BetaRawMessageStopEvent from a Hash of raw data.
      #
      # @overload initialize(type: nil)
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
