# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingConfigEnabled < Anthropic::Internal::Type::BaseModel
      # @!attribute budget_tokens
      #   Determines how many tokens Claude can use for its internal reasoning process.
      #   Larger budgets can enable more thorough analysis for complex problems, improving
      #   response quality.
      #
      #   Must be ≥1024 and less than `max_tokens`.
      #
      #   See
      #   [extended thinking](https://docs.claude.com/en/docs/build-with-claude/extended-thinking)
      #   for details.
      #
      #   @return [Integer]
      required :budget_tokens, Integer

      # @!attribute type
      #
      #   @return [Symbol, :enabled]
      required :type, const: :enabled

      # @!attribute display_
      #   Controls how thinking content appears in the response. When set to `summarized`,
      #   thinking is returned normally. When set to `omitted`, thinking content is
      #   redacted but a signature is returned for multi-turn continuity. Defaults to
      #   `summarized`.
      #
      #   @return [Symbol, Anthropic::Models::ThinkingConfigEnabled::Display, nil]
      optional :display_,
               enum: -> {
                 Anthropic::ThinkingConfigEnabled::Display
               },
               api_name: :display,
               nil?: true

      # @!method initialize(budget_tokens:, display_: nil, type: :enabled)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ThinkingConfigEnabled} for more details.
      #
      #   @param budget_tokens [Integer] Determines how many tokens Claude can use for its internal reasoning process. La
      #
      #   @param display_ [Symbol, Anthropic::Models::ThinkingConfigEnabled::Display, nil] Controls how thinking content appears in the response. When set to `summarized`,
      #
      #   @param type [Symbol, :enabled]

      # Controls how thinking content appears in the response. When set to `summarized`,
      # thinking is returned normally. When set to `omitted`, thinking content is
      # redacted but a signature is returned for multi-turn continuity. Defaults to
      # `summarized`.
      #
      # @see Anthropic::Models::ThinkingConfigEnabled#display_
      module Display
        extend Anthropic::Internal::Type::Enum

        SUMMARIZED = :summarized
        OMITTED = :omitted

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
