# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlock }

      variant :thinking, -> { Anthropic::ThinkingBlock }

      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlock }

      variant :tool_use, -> { Anthropic::ToolUseBlock }

      variant :server_tool_use, -> { Anthropic::ServerToolUseBlock }

      variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlock }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock)]
    end
  end
end
