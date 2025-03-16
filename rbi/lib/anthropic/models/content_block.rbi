# typed: strong

module Anthropic
  module Models
    class ContentBlock < Anthropic::Union
      abstract!

      Variants = type_template(:out) do
        {
          fixed: T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
        }
      end
    end
  end
end
