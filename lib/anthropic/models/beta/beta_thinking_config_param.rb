# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # Configuration for enabling Claude's extended thinking.
      #
      #   When enabled, responses include `thinking` content blocks showing Claude's
      #   thinking process before the final answer. Requires a minimum budget of 1,024
      #   tokens and counts towards your `max_tokens` limit.
      #
      #   See
      #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      #   for details.
      #
      # @example
      # ```ruby
      # case beta_thinking_config_param
      # in {type: "enabled", budget_tokens: Integer}
      #   # Anthropic::Models::Beta::BetaThinkingConfigEnabled ...
      # in {type: "disabled"}
      #   # Anthropic::Models::Beta::BetaThinkingConfigDisabled ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case beta_thinking_config_param
      # in Anthropic::Models::Beta::BetaThinkingConfigEnabled
      #   # ...
      # in Anthropic::Models::Beta::BetaThinkingConfigDisabled
      #   # ...
      # end
      # ```
      class BetaThinkingConfigParam < Anthropic::Union
        discriminator :type

        variant :enabled, -> { Anthropic::Models::Beta::BetaThinkingConfigEnabled }

        variant :disabled, -> { Anthropic::Models::Beta::BetaThinkingConfigDisabled }
      end
    end

    BetaThinkingConfigParam = Beta::BetaThinkingConfigParam
  end
end
