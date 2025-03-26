# frozen_string_literal: true

module Anthropic
  module Models
    module StopReason
      extend Anthropic::Enum

      END_TURN = :end_turn
      MAX_TOKENS = :max_tokens
      STOP_SEQUENCE = :stop_sequence
      TOOL_USE = :tool_use

      finalize!

      # @!parse
      #   # @return [Array<Symbol>]
      #   def self.values; end
    end
  end
end
