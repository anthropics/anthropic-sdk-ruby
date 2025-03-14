# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = T.type_alias { Beta::BetaContentBlockParam }

    module Beta
      class BetaContentBlockParam < Anthropic::Union
        abstract!

        class << self
          # @api private
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Beta::BetaTextBlockParam], [Symbol, Anthropic::Models::Beta::BetaImageBlockParam], [Symbol, Anthropic::Models::Beta::BetaToolUseBlockParam], [Symbol, Anthropic::Models::Beta::BetaToolResultBlockParam], [Symbol, Anthropic::Models::Beta::BetaBase64PDFBlock], [Symbol, Anthropic::Models::Beta::BetaThinkingBlockParam], [Symbol, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
