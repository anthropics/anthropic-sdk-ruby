# typed: strong

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Union

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::TextBlock,
              Anthropic::Models::ToolUseBlock,
              Anthropic::Models::ThinkingBlock,
              Anthropic::Models::RedactedThinkingBlock
            )
          }
        end

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock]
            )
        end
        def variants
        end
      end
    end
  end
end
