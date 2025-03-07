# typed: strong

module Anthropic
  module Models
    class ContentBlockParam < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::TextBlockParam], [Symbol, Anthropic::Models::ImageBlockParam], [Symbol, Anthropic::Models::ToolUseBlockParam], [Symbol, Anthropic::Models::ToolResultBlockParam], [Symbol, Anthropic::Models::DocumentBlockParam], [Symbol, Anthropic::Models::ThinkingBlockParam], [Symbol, Anthropic::Models::RedactedThinkingBlockParam]]
            )
        end
        private def variants
        end
      end
    end
  end
end
