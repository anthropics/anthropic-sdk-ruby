# typed: strong

module Anthropic
  module Models
    class ContentBlock < Anthropic::Union
      abstract!

      class << self
        # @api private
        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::TextBlock], [Symbol, Anthropic::Models::ToolUseBlock], [Symbol, Anthropic::Models::ThinkingBlock], [Symbol, Anthropic::Models::RedactedThinkingBlock]]
            )
        end
        private def variants
        end
      end
    end
  end
end
