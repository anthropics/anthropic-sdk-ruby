# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # raw_message_stop_event => {
    #   type: enum: Anthropic::Models::RawMessageStopEvent::Type
    # }
    # ```
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
      # case type
      # in :message_stop
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        MESSAGE_STOP = :message_stop

        finalize!
      end
    end
  end
end
