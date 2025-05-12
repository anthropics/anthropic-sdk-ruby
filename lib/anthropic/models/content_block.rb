# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlock }

      variant :tool_use, -> { Anthropic::ToolUseBlock }

      variant :server_tool_use, -> { Anthropic::ServerToolUseBlock }

      variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlock }

      variant :thinking, -> { Anthropic::ThinkingBlock }

      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlock }

      # @!method self.variants
      #   @return [Array(Anthropic::TextBlock, Anthropic::ToolUseBlock, Anthropic::ServerToolUseBlock, Anthropic::WebSearchToolResultBlock, Anthropic::ThinkingBlock, Anthropic::RedactedThinkingBlock)]

      define_sorbet_constant!(:Variants) do
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
      end
    end
  end
end
