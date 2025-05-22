# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlockParam }

      variant :image, -> { Anthropic::ImageBlockParam }

      variant :tool_use, -> { Anthropic::ToolUseBlockParam }

      variant :server_tool_use, -> { Anthropic::ServerToolUseBlockParam }

      variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlockParam }

      variant :tool_result, -> { Anthropic::ToolResultBlockParam }

      variant :document, -> { Anthropic::DocumentBlockParam }

      variant :thinking, -> { Anthropic::ThinkingBlockParam }

      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam)]
    end
  end
end
