# typed: strong

module Anthropic
  module Models
    BetaContentBlock = T.type_alias { Beta::BetaContentBlock }

    module Beta
      class BetaContentBlock < Anthropic::Union
        abstract!

        Variants = type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::Beta::BetaTextBlock,
              Anthropic::Models::Beta::BetaToolUseBlock,
              Anthropic::Models::Beta::BetaThinkingBlock,
              Anthropic::Models::Beta::BetaRedactedThinkingBlock
            )
          }
        end
      end
    end
  end
end
