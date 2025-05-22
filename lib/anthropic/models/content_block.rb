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
      #   @return [Array(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock)]
    end
  end
end
