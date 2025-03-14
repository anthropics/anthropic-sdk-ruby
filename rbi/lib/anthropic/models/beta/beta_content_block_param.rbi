# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = T.type_alias { Beta::BetaContentBlockParam }

    module Beta
      class BetaContentBlockParam < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
