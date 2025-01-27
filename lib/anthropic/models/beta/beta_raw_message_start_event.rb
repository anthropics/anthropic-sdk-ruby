# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_message_start_event => {
      #   message: Anthropic::Models::Beta::BetaMessage,
      #   type: :message_start
      # }
      # ```
      class BetaRawMessageStartEvent < Anthropic::BaseModel
        # @!attribute message
        #
        #   @return [Anthropic::Models::Beta::BetaMessage]
        required :message, -> { Anthropic::Models::Beta::BetaMessage }

        # @!attribute type
        #
        #   @return [Symbol, :message_start]
        required :type, const: :message_start

        # @!parse
        #   # @param message [Anthropic::Models::Beta::BetaMessage]
        #   # @param type [Symbol, :message_start]
        #   #
        #   def initialize(message:, type: :message_start, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaRawMessageStartEvent = Beta::BetaRawMessageStartEvent
  end
end
