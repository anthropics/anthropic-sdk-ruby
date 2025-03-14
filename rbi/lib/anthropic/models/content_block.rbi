# typed: strong

module Anthropic
  module Models
    class ContentBlock < Anthropic::Union
      abstract!

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
