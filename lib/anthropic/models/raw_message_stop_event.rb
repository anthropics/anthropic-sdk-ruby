# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStopEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :message_stop]
      required :type, const: :message_stop

      # @!parse
      #   # @param type [Symbol, :message_stop]
      #   #
      #   def initialize(type: :message_stop, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
