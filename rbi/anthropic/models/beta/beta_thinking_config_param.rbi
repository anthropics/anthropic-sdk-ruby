# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigParam = Beta::BetaThinkingConfigParam

    module Beta
      # Configuration for Claude's thinking.
      #
      # With `{"type": "adaptive"}`, Claude decides when and how much to think. With
      # `{"type": "enabled"}` (manual extended thinking), you set a `budget_tokens` of
      # at least 1,024. Thinking tokens count toward your `max_tokens` limit.
      #
      # Which `type` values are accepted, and what happens when you omit `thinking`,
      # depend on the model. See
      # [thinking](https://platform.claude.com/docs/en/build-with-claude/thinking#configuring-thinking)
      # for each model's behavior.
      module BetaThinkingConfigParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingConfigEnabled,
              Anthropic::Beta::BetaThinkingConfigDisabled,
              Anthropic::Beta::BetaThinkingConfigBetweenTools,
              Anthropic::Beta::BetaThinkingConfigAdaptive
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaThinkingConfigParam::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaThinkingConfigParam::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaThinkingConfigParam::Type::TaggedSymbol
            )
          BETWEEN_TOOLS =
            T.let(
              :between_tools,
              Anthropic::Beta::BetaThinkingConfigParam::Type::TaggedSymbol
            )
          ADAPTIVE =
            T.let(
              :adaptive,
              Anthropic::Beta::BetaThinkingConfigParam::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaThinkingConfigParam::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
            type: Anthropic::Beta::BetaThinkingConfigParam::Type::OrSymbol,
            budget_tokens: Integer,
            block_binding:
              T.nilable(Anthropic::Beta::BetaThinkingBlockBinding::OrHash),
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
          # Controls for block binding: what happens when a thinking block this request
          # sends back fails the conversation check. `null`, absent or an empty object means
          # every default.
          block_binding: nil,
          # Controls how thinking content appears in the response. When set to `summarized`,
          # thinking is returned normally. When set to `omitted`, thinking content is
          # redacted but a signature is returned for multi-turn continuity. The default
          # depends on the model; see
          # [Controlling thinking display](https://platform.claude.com/docs/en/build-with-claude/thinking#controlling-thinking-display).
          display_: nil
        )
        end
      end
    end
  end
end
