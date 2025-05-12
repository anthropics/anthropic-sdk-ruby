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
        #   @return [Array(Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam, Anthropic::Beta::BetaToolUseBlockParam, Anthropic::Beta::BetaServerToolUseBlockParam, Anthropic::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Beta::BetaToolResultBlockParam, Anthropic::Beta::BetaBase64PDFBlock, Anthropic::Beta::BetaThinkingBlockParam, Anthropic::Beta::BetaRedactedThinkingBlockParam)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Beta::BetaImageBlockParam,
              Anthropic::Beta::BetaToolUseBlockParam,
              Anthropic::Beta::BetaServerToolUseBlockParam,
              Anthropic::Beta::BetaWebSearchToolResultBlockParam,
              Anthropic::Beta::BetaToolResultBlockParam,
              Anthropic::Beta::BetaBase64PDFBlock,
              Anthropic::Beta::BetaThinkingBlockParam,
              Anthropic::Beta::BetaRedactedThinkingBlockParam
            )
          end
        end
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
