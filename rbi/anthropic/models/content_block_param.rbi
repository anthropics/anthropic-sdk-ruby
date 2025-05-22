# typed: strong

module Anthropic
  module Models
    # Regular text content.
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::ServerToolUseBlockParam,
            Anthropic::WebSearchToolResultBlockParam,
            Anthropic::TextBlockParam,
            Anthropic::ImageBlockParam,
            Anthropic::ToolUseBlockParam,
            Anthropic::ToolResultBlockParam,
            Anthropic::DocumentBlockParam,
            Anthropic::ThinkingBlockParam,
            Anthropic::RedactedThinkingBlockParam
          )
        end

      sig { override.returns(T::Array[Anthropic::ContentBlockParam::Variants]) }
      def self.variants
      end
    end
  end
end
