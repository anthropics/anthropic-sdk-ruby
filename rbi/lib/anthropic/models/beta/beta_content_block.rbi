# typed: strong

module Anthropic
  module Models
    BetaContentBlock = T.type_alias { Beta::BetaContentBlock }

    module Beta
      class BetaContentBlock < Anthropic::Union
        abstract!

        class << self
          # @api private
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Beta::BetaTextBlock], [Symbol, Anthropic::Models::Beta::BetaToolUseBlock], [Symbol, Anthropic::Models::Beta::BetaThinkingBlock], [Symbol, Anthropic::Models::Beta::BetaRedactedThinkingBlock]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
