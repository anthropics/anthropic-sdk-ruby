# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaContentBlock
        extend Anthropic::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::Beta::BetaTextBlock,
                Anthropic::Models::Beta::BetaToolUseBlock,
                Anthropic::Models::Beta::BetaThinkingBlock,
                Anthropic::Models::Beta::BetaRedactedThinkingBlock
              )
            }
          end

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

    BetaContentBlock = Beta::BetaContentBlock
  end
end
