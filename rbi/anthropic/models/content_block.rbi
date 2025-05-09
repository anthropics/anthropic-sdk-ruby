# typed: strong

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::TextBlock,
            Anthropic::ToolUseBlock,
            Anthropic::ServerToolUseBlock,
            Anthropic::WebSearchToolResultBlock,
            Anthropic::ThinkingBlock,
            Anthropic::RedactedThinkingBlock
          )
        end

      sig { override.returns(T::Array[Anthropic::ContentBlock::Variants]) }
      def self.variants
      end
    end
  end
end
