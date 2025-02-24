# typed: strong

module Anthropic
  module Models
    class ContentBlockParam < Anthropic::Union
      abstract!

      sig do
        override
          .returns(
            [[Symbol, Anthropic::Models::TextBlockParam], [Symbol, Anthropic::Models::ImageBlockParam], [Symbol, Anthropic::Models::ToolUseBlockParam], [Symbol, Anthropic::Models::ToolResultBlockParam], [Symbol, Anthropic::Models::DocumentBlockParam], [Symbol, Anthropic::Models::ThinkingBlockParam], [Symbol, Anthropic::Models::RedactedThinkingBlockParam]]
          )
      end
      private_class_method def self.variants
      end
    end
  end
end
