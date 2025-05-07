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

        variant :tool_result, -> { Anthropic::Beta::BetaToolResultBlockParam }

        variant :document, -> { Anthropic::Beta::BetaBase64PDFBlock }

        variant :thinking, -> { Anthropic::Beta::BetaThinkingBlockParam }

        variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam, Anthropic::Beta::BetaToolUseBlockParam, Anthropic::Beta::BetaToolResultBlockParam, Anthropic::Beta::BetaBase64PDFBlock, Anthropic::Beta::BetaThinkingBlockParam, Anthropic::Beta::BetaRedactedThinkingBlockParam)]
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
