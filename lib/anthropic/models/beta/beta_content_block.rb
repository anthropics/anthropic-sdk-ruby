# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaContentBlock
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlock }

        variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlock }

        variant :thinking, -> { Anthropic::Models::Beta::BetaThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::Models::Beta::BetaRedactedThinkingBlock }

        # @!parse
        #   # @return [Array(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock)]
        #   def self.variants; end
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
