# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [Anthropic::Models::Message]
      required :message, -> { Anthropic::Message }

      # @!attribute type
      #
      #   @return [Symbol, :message_start]
      required :type, const: :message_start

      # @!method initialize(message:, type: :message_start)
      #   @param message [Anthropic::Models::Message]
      #   @param type [Symbol, :message_start]
    end
  end
end
