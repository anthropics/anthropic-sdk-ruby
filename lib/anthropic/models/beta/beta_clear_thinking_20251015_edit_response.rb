# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaClearThinking20251015EditResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute cleared_input_tokens
        #   Number of input tokens cleared by this edit.
        #
        #   @return [Integer]
        required :cleared_input_tokens, Integer

        # @!attribute cleared_thinking_turns
        #   Number of thinking turns that were cleared.
        #
        #   @return [Integer]
        required :cleared_thinking_turns, Integer

        # @!attribute type
        #   The type of context management edit applied.
        #
        #   @return [Symbol, :clear_thinking_20251015]
        required :type, const: :clear_thinking_20251015

        # @!method initialize(cleared_input_tokens:, cleared_thinking_turns:, type: :clear_thinking_20251015)
        #   @param cleared_input_tokens [Integer] Number of input tokens cleared by this edit.
        #
        #   @param cleared_thinking_turns [Integer] Number of thinking turns that were cleared.
        #
        #   @param type [Symbol, :clear_thinking_20251015] The type of context management edit applied.
      end
    end

    BetaClearThinking20251015EditResponse = Beta::BetaClearThinking20251015EditResponse
  end
end
