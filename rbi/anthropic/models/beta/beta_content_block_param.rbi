# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = Beta::BetaContentBlockParam

    module Beta
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam]
            )
        end
        def self.variants; end
      end
    end
  end
end
