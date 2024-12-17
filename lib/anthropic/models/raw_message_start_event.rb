# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [Anthropic::Models::Message]
      required :message, -> { Anthropic::Models::Message }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::RawMessageStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawMessageStartEvent::Type }

      # @!parse
      #   # @param message [Anthropic::Models::Message]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :message_start
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        MESSAGE_START = :message_start
      end
    end
  end
end
