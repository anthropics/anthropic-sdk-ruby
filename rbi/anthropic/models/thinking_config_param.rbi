# typed: strong

module Anthropic
  module Models
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
    module ThinkingConfigParam
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::ThinkingConfigEnabled,
            Anthropic::ThinkingConfigDisabled,
            Anthropic::ThinkingConfigBetweenTools,
            Anthropic::ThinkingConfigAdaptive
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ThinkingConfigParam::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, Anthropic::ThinkingConfigParam::Type::TaggedSymbol)
        DISABLED =
          T.let(:disabled, Anthropic::ThinkingConfigParam::Type::TaggedSymbol)
        BETWEEN_TOOLS =
          T.let(
            :between_tools,
            Anthropic::ThinkingConfigParam::Type::TaggedSymbol
          )
        ADAPTIVE =
          T.let(:adaptive, Anthropic::ThinkingConfigParam::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::ThinkingConfigParam::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig do
        override.returns(T::Array[Anthropic::ThinkingConfigParam::Variants])
      end
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: Anthropic::ThinkingConfigParam::Type::OrSymbol,
          budget_tokens: Integer,
          display_:
            T.any(
              T.nilable(Anthropic::ThinkingConfigEnabled::Display::OrSymbol),
              T.nilable(Anthropic::ThinkingConfigAdaptive::Display::OrSymbol)
            )
        ).returns(Anthropic::ThinkingConfigParam::Variants)
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
        # redacted but a signature is returned for multi-turn continuity. The default
        # depends on the model; see
        # [Controlling thinking display](https://platform.claude.com/docs/en/build-with-claude/thinking#controlling-thinking-display).
        display_: nil
      )
      end
    end
  end
end
