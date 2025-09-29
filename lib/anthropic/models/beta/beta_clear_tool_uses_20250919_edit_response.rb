# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaClearToolUses20250919EditResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute cleared_input_tokens
        #   Number of input tokens cleared by this edit.
        #
        #   @return [Integer]
        required :cleared_input_tokens, Integer

        # @!attribute cleared_tool_uses
        #   Number of tool uses that were cleared.
        #
        #   @return [Integer]
        required :cleared_tool_uses, Integer

        # @!attribute type
        #   The type of context management edit applied.
        #
        #   @return [Symbol, :clear_tool_uses_20250919]
        required :type, const: :clear_tool_uses_20250919

        # @!method initialize(cleared_input_tokens:, cleared_tool_uses:, type: :clear_tool_uses_20250919)
        #   Results for clear_tool_uses_20250919 edit.
        #
        #   @param cleared_input_tokens [Integer] Number of input tokens cleared by this edit.
        #
        #   @param cleared_tool_uses [Integer] Number of tool uses that were cleared.
        #
        #   @param type [Symbol, :clear_tool_uses_20250919] The type of context management edit applied.
      end
    end

    BetaClearToolUses20250919EditResponse = Beta::BetaClearToolUses20250919EditResponse
  end
end
