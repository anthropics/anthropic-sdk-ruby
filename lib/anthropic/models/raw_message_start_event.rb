# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # raw_message_start_event => {
    #   message: Anthropic::Models::Message,
    #   type: :message_start
    # }
    # ```
    class RawMessageStartEvent < Anthropic::BaseModel
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
      #   # @param type [String]
      #   #
      #   def initialize(message:, type: :message_start, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
