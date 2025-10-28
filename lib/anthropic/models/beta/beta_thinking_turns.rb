# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingTurns < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :thinking_turns]
        required :type, const: :thinking_turns

        # @!attribute value
        #
        #   @return [Integer]
        required :value, Integer

        # @!method initialize(value:, type: :thinking_turns)
        #   @param value [Integer]
        #   @param type [Symbol, :thinking_turns]
      end
    end

    BetaThinkingTurns = Beta::BetaThinkingTurns
  end
end
