# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_message_stop_event => {
      #   type: :message_stop
      # }
      # ```
      class BetaRawMessageStopEvent < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :message_stop]
        required :type, const: :message_stop

        # @!parse
        #   # @param type [String]
        #   #
        #   def initialize(type: :message_stop, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaRawMessageStopEvent = Beta::BetaRawMessageStopEvent
  end
end
