# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStartEvent < BaseModel
      # @!attribute [rw] message
      #   @return [Anthropic::Models::Message]
      required :message, -> { Anthropic::Models::Message }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawMessageStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawMessageStartEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_START = :message_start
      end
    end
  end
end
