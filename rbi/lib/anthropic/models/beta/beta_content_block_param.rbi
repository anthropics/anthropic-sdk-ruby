# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = T.type_alias { Beta::BetaContentBlockParam }

    module Beta
      class BetaContentBlockParam < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::Beta::BetaTextBlockParam,
            Anthropic::Models::Beta::BetaImageBlockParam,
            Anthropic::Models::Beta::BetaToolUseBlockParam,
            Anthropic::Models::Beta::BetaToolResultBlockParam,
            Anthropic::Models::Beta::BetaBase64PDFBlock
          )
        end

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::Beta::BetaTextBlockParam],
              [Symbol, Anthropic::Models::Beta::BetaImageBlockParam],
              [Symbol, Anthropic::Models::Beta::BetaToolUseBlockParam],
              [Symbol, Anthropic::Models::Beta::BetaToolResultBlockParam],
              [Symbol, Anthropic::Models::Beta::BetaBase64PDFBlock]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
