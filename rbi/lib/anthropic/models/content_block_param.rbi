# typed: strong

module Anthropic
  module Models
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      sig do
        override
          .returns(
            [Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam]
          )
      end
      def self.variants; end
    end
  end
end
