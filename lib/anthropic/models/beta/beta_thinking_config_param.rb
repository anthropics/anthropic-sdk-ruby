# frozen_string_literal: true

module Anthropic
  module Models
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

        discriminator :type

        variant :enabled, -> { Anthropic::Beta::BetaThinkingConfigEnabled }

        variant :disabled, -> { Anthropic::Beta::BetaThinkingConfigDisabled }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaThinkingConfigEnabled, Anthropic::Beta::BetaThinkingConfigDisabled)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(Anthropic::Beta::BetaThinkingConfigEnabled, Anthropic::Beta::BetaThinkingConfigDisabled)
          end
        end
      end
    end

    BetaThinkingConfigParam = Beta::BetaThinkingConfigParam
  end
end
