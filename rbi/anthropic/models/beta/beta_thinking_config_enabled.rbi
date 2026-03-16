# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigEnabled = Beta::BetaThinkingConfigEnabled

    module Beta
      class BetaThinkingConfigEnabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingConfigEnabled,
              Anthropic::Internal::AnyHash
            )
          end

        # Determines how many tokens Claude can use for its internal reasoning process.
        # Larger budgets can enable more thorough analysis for complex problems, improving
        # response quality.
        #
        # Must be ≥1024 and less than `max_tokens`.
        #
        # See
        # [extended thinking](https://docs.claude.com/en/docs/build-with-claude/extended-thinking)
        # for details.
        sig { returns(Integer) }
        attr_accessor :budget_tokens

        sig { returns(Symbol) }
        attr_accessor :type

        # Controls how thinking content appears in the response. When set to `summarized`,
        # thinking is returned normally. When set to `omitted`, thinking content is
        # redacted but a signature is returned for multi-turn continuity. Defaults to
        # `summarized`.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaThinkingConfigEnabled::Display::OrSymbol
            )
          )
        end
        attr_accessor :display_

        sig do
          params(
            budget_tokens: Integer,
            display_:
              T.nilable(
                Anthropic::Beta::BetaThinkingConfigEnabled::Display::OrSymbol
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Determines how many tokens Claude can use for its internal reasoning process.
          # Larger budgets can enable more thorough analysis for complex problems, improving
          # response quality.
          #
          # Must be ≥1024 and less than `max_tokens`.
          #
          # See
          # [extended thinking](https://docs.claude.com/en/docs/build-with-claude/extended-thinking)
          # for details.
          budget_tokens:,
          # Controls how thinking content appears in the response. When set to `summarized`,
          # thinking is returned normally. When set to `omitted`, thinking content is
          # redacted but a signature is returned for multi-turn continuity. Defaults to
          # `summarized`.
          display_: nil,
          type: :enabled
        )
        end

        sig do
          override.returns(
            {
              budget_tokens: Integer,
              type: Symbol,
              display_:
                T.nilable(
                  Anthropic::Beta::BetaThinkingConfigEnabled::Display::OrSymbol
                )
            }
          )
        end
        def to_hash
        end

        # Controls how thinking content appears in the response. When set to `summarized`,
        # thinking is returned normally. When set to `omitted`, thinking content is
        # redacted but a signature is returned for multi-turn continuity. Defaults to
        # `summarized`.
        module Display
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaThinkingConfigEnabled::Display)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUMMARIZED =
            T.let(
              :summarized,
              Anthropic::Beta::BetaThinkingConfigEnabled::Display::TaggedSymbol
            )
          OMITTED =
            T.let(
              :omitted,
              Anthropic::Beta::BetaThinkingConfigEnabled::Display::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaThinkingConfigEnabled::Display::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
