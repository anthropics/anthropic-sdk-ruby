# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaContentBlock
        extend Anthropic::Internal::Type::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock]
            )
        end
        def self.variants
        end
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
