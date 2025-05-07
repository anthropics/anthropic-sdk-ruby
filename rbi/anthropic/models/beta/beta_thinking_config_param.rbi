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
      # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      # for details.
      module BetaThinkingConfigParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingConfigEnabled,
              Anthropic::Beta::BetaThinkingConfigDisabled
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaThinkingConfigParam::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
