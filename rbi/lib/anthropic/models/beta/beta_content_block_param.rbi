# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaContentBlockParam
        extend Anthropic::Union

        Variants =
          type_template(:out) do
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

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
