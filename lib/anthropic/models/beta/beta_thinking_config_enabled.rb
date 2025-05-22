# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingConfigEnabled < Anthropic::Internal::Type::BaseModel
        # @!attribute budget_tokens
        #   Determines how many tokens Claude can use for its internal reasoning process.
        #   Larger budgets can enable more thorough analysis for complex problems, improving
        #   response quality.
        #
        #   Must be ≥1024 and less than `max_tokens`.
        #
        #   See
        #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        #   for details.
        #
        #   @return [Integer]
        required :budget_tokens, Integer

        # @!attribute type
        #
        #   @return [Symbol, :enabled]
        required :type, const: :enabled

        # @!method initialize(budget_tokens:, type: :enabled)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaThinkingConfigEnabled} for more details.
        #
        #   @param budget_tokens [Integer] Determines how many tokens Claude can use for its internal reasoning process. La
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaThinkingConfigEnabled = Beta::BetaThinkingConfigEnabled
  end
end
