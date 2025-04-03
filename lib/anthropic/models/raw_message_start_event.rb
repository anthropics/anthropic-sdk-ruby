# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [Anthropic::Models::Message]
      required :message, -> { Anthropic::Models::Message }

      # @!attribute type
      #
      #   @return [Symbol, :message_start]
      required :type, const: :message_start

      # @!parse
      #   # @param message [Anthropic::Models::Message]
      #   # @param type [Symbol, :message_start]
      #   #
      #   def initialize(message:, type: :message_start, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
