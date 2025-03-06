# frozen_string_literal: true

module Anthropic
  module Models
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
    class ThinkingConfigParam < Anthropic::Union
      discriminator :type

      variant :enabled, -> { Anthropic::Models::ThinkingConfigEnabled }

      variant :disabled, -> { Anthropic::Models::ThinkingConfigDisabled }
    end
  end
end
