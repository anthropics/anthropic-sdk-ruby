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
    end
  end
end
