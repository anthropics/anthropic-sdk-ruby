# frozen_string_literal: true

module Anthropic
  module Models
    module StopReason
      extend Anthropic::Internal::Type::Enum

      END_TURN = :end_turn
      MAX_TOKENS = :max_tokens
      STOP_SEQUENCE = :stop_sequence
      TOOL_USE = :tool_use

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
