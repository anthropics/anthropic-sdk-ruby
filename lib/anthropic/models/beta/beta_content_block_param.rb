# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

        variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlockParam }

        variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlockParam }

        variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlockParam }

        variant :tool_result, -> { Anthropic::Beta::BetaToolResultBlockParam }

        variant :document, -> { Anthropic::Beta::BetaBase64PDFBlock }

        variant :thinking, -> { Anthropic::Beta::BetaThinkingBlockParam }

        variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam)]
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
