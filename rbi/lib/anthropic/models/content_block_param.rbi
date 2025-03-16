# typed: strong

module Anthropic
  module Models
    class ContentBlockParam < Anthropic::Union
      abstract!

      Variants = type_template(:out) do
        {
          fixed: T.any(
            Anthropic::Models::TextBlockParam,
            Anthropic::Models::ImageBlockParam,
            Anthropic::Models::ToolUseBlockParam,
            Anthropic::Models::ToolResultBlockParam,
            Anthropic::Models::DocumentBlockParam,
            Anthropic::Models::ThinkingBlockParam,
            Anthropic::Models::RedactedThinkingBlockParam
          )
        }
      end
    end
  end
end
