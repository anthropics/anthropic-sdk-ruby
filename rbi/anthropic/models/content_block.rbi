# typed: strong

module Anthropic
  module Models
    # Response model for a file uploaded to the container.
    module ContentBlock
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::TextBlock,
            Anthropic::ThinkingBlock,
            Anthropic::RedactedThinkingBlock,
            Anthropic::ToolUseBlock,
            Anthropic::ServerToolUseBlock,
            Anthropic::WebSearchToolResultBlock,
            Anthropic::WebFetchToolResultBlock,
            Anthropic::CodeExecutionToolResultBlock,
            Anthropic::BashCodeExecutionToolResultBlock,
            Anthropic::TextEditorCodeExecutionToolResultBlock,
            Anthropic::ToolSearchToolResultBlock,
            Anthropic::ContainerUploadBlock
          )
        end

      sig { override.returns(T::Array[Anthropic::ContentBlock::Variants]) }
      def self.variants
      end
    end
  end
end
