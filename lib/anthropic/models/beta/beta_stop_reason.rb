# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaStopReason
        extend Anthropic::Internal::Type::Enum

        END_TURN = :end_turn
        MAX_TOKENS = :max_tokens
        STOP_SEQUENCE = :stop_sequence
        TOOL_USE = :tool_use
        PAUSE_TURN = :pause_turn
        COMPACTION = :compaction
        REFUSAL = :refusal
        MODEL_CONTEXT_WINDOW_EXCEEDED = :model_context_window_exceeded

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaStopReason = Beta::BetaStopReason
  end
end
