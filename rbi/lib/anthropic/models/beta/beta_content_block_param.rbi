# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = T.type_alias { Beta::BetaContentBlockParam }

    module Beta
      class BetaContentBlockParam < Anthropic::Union
        abstract!

        Variants = type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::Beta::BetaTextBlockParam,
              Anthropic::Models::Beta::BetaImageBlockParam,
              Anthropic::Models::Beta::BetaToolUseBlockParam,
              Anthropic::Models::Beta::BetaToolResultBlockParam,
              Anthropic::Models::Beta::BetaBase64PDFBlock,
              Anthropic::Models::Beta::BetaThinkingBlockParam,
              Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
            )
          }
        end
      end
    end
  end
end
