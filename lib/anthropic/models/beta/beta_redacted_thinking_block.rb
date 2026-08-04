# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRedactedThinkingBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute data
        #   The contents of this redacted thinking block, returned when portions of the
        #   model's thinking were safety-redacted. This field is opaque and encrypted, with
        #   no readable content.
        #
        #   Pass `redacted_thinking` blocks back to the API unchanged when continuing a
        #   multi-turn conversation.
        #
        #   See
        #   [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking#redacted-thinking-blocks)
        #   for details.
        #
        #   @return [String]
        required :data, String

        # @!attribute type
        #
        #   @return [Symbol, :redacted_thinking]
        required :type, const: :redacted_thinking

        # @!method initialize(data:, type: :redacted_thinking)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaRedactedThinkingBlock} for more details.
        #
        #   @param data [String] The contents of this redacted thinking block, returned when portions of the mode
        #
        #   @param type [Symbol, :redacted_thinking]
      end
    end

    BetaRedactedThinkingBlock = Beta::BetaRedactedThinkingBlock
  end
end
