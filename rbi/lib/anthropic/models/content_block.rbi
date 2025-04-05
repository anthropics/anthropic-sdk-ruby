# typed: strong

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Internal::Type::Union

      sig do
        override
          .returns(
            [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock]
          )
      end
      def self.variants; end
    end
  end
end
