# frozen_string_literal: true

module Anthropic
  module Models
    # Configuration for enabling Claude's extended thinking.
    #
    #   When enabled, responses include `thinking` content blocks showing Claude's
    #   thinking process before the final answer. Requires a minimum budget of 1,024
    #   tokens and counts towards your `max_tokens` limit.
    #
    #   See
    #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
    #   for details.
    module ThinkingConfigParam
      extend Anthropic::Union

      discriminator :type

      variant :enabled, -> { Anthropic::Models::ThinkingConfigEnabled }

      variant :disabled, -> { Anthropic::Models::ThinkingConfigDisabled }

      # @!parse
      #   class << self
      #     # @return [Array(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled)]
      #     def variants; end
      #   end
    end
  end
end
