# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaContentBlock
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::Beta::BetaTextBlock }

        variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlock }

        variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlock }

        variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlock }

        variant :thinking, -> { Anthropic::Beta::BetaThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaTextBlock, Anthropic::Beta::BetaToolUseBlock, Anthropic::Beta::BetaServerToolUseBlock, Anthropic::Beta::BetaWebSearchToolResultBlock, Anthropic::Beta::BetaThinkingBlock, Anthropic::Beta::BetaRedactedThinkingBlock)]
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
