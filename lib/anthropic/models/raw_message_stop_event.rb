# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStopEvent < Anthropic::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::RawMessageStopEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawMessageStopEvent::Type }

      # @!parse
      #   # @param type [String]
      #   #
      #   def initialize(type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :message_stop
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        MESSAGE_STOP = :message_stop
      end
    end
  end
end
