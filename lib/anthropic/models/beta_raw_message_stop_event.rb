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
    end
  end
end
