# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigParam = Beta::BetaThinkingConfigParam

    module Beta
      # Configuration for enabling Claude's extended thinking.
      #
      # When enabled, responses include `thinking` content blocks showing Claude's
      # thinking process before the final answer. Requires a minimum budget of 1,024
      # tokens and counts towards your `max_tokens` limit.
      #
      # See
      # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
      # for details.
      module BetaThinkingConfigParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingConfigEnabled,
              Anthropic::Beta::BetaThinkingConfigDisabled,
              Anthropic::Beta::BetaThinkingConfigAdaptive
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaThinkingConfigParam::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            budget_tokens: Integer,
            display_:
              T.any(
                T.nilable(
                  Anthropic::Beta::BetaThinkingConfigEnabled::Display::OrSymbol
                ),
                T.nilable(
                  Anthropic::Beta::BetaThinkingConfigAdaptive::Display::OrSymbol
                )
              )
          ).returns(Anthropic::Beta::BetaThinkingConfigParam::Variants)
        end
        def self.new(
          type:,
          # Determines how many tokens Claude can use for its internal reasoning process.
          # Larger budgets can enable more thorough analysis for complex problems, improving
          # response quality.
          #
          # Must be ≥1024 and less than `max_tokens`.
          #
          # See
          # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
          # for details.
          budget_tokens: nil,
          # Controls how thinking content appears in the response. When set to `summarized`,
          # thinking is returned normally. When set to `omitted`, thinking content is
          # redacted but a signature is returned for multi-turn continuity. Defaults to
          # `summarized`.
          display_: nil
        )
        end
      end
    end
  end
end
