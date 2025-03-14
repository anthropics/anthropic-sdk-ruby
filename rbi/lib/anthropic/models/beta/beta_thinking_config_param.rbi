# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigParam = T.type_alias { Beta::BetaThinkingConfigParam }

    module Beta
      # Configuration for enabling Claude's extended thinking.
      #
      #   When enabled, responses include `thinking` content blocks showing Claude's
      #   thinking process before the final answer. Requires a minimum budget of 1,024
      #   tokens and counts towards your `max_tokens` limit.
      #
      #   See
      #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      #   for details.
      class BetaThinkingConfigParam < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
