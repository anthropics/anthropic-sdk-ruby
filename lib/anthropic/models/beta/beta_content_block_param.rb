# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }

        variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlockParam }

        variant :tool_result, -> { Anthropic::Models::Beta::BetaToolResultBlockParam }

        variant :document, -> { Anthropic::Models::Beta::BetaBase64PDFBlock }

        variant :thinking, -> { Anthropic::Models::Beta::BetaThinkingBlockParam }

        variant :redacted_thinking, -> { Anthropic::Models::Beta::BetaRedactedThinkingBlockParam }

        # @!parse
        #   # @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam)]
        #   def self.variants; end
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
