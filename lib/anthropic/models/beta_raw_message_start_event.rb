# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRawMessageStartEvent < BaseModel
      # @!attribute [rw] message
      #   @return [Anthropic::Models::BetaMessage]
      required :message, -> { Anthropic::Models::BetaMessage }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRawMessageStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::BetaRawMessageStartEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_START = :message_start
      end
    end
  end
end
