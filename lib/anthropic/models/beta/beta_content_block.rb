# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      class BetaContentBlock < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlock }

        variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlock }

        variant :thinking, -> { Anthropic::Models::Beta::BetaThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::Models::Beta::BetaRedactedThinkingBlock }
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
