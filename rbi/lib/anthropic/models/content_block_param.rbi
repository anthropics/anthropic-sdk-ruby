# typed: strong

module Anthropic
  module Models
    class ContentBlockParam < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam]
            )
        end
        def variants
        end
      end
    end
  end
end
