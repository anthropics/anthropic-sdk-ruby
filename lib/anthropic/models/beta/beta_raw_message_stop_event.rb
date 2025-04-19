# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawMessageStopEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :message_stop]
        required :type, const: :message_stop

        # @!method initialize(type: :message_stop)
        #   @param type [Symbol, :message_stop]
      end
    end

    BetaRawMessageStopEvent = Beta::BetaRawMessageStopEvent
  end
end
