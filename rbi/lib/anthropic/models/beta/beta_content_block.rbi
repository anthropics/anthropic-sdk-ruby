# typed: strong

module Anthropic
  module Models
    BetaContentBlock = T.type_alias { Beta::BetaContentBlock }

    module Beta
      class BetaContentBlock < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
