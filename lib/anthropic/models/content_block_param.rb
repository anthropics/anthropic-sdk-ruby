# frozen_string_literal: true

module Anthropic
  module Models
    # Regular text content.
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :server_tool_use, -> { Anthropic::ServerToolUseBlockParam }

      variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlockParam }

      # Regular text content.
      variant :text, -> { Anthropic::TextBlockParam }

      # Image content specified directly as base64 data or as a reference via a URL.
      variant :image, -> { Anthropic::ImageBlockParam }

      # A block indicating a tool use by the model.
      variant :tool_use, -> { Anthropic::ToolUseBlockParam }

      # A block specifying the results of a tool use by the model.
      variant :tool_result, -> { Anthropic::ToolResultBlockParam }

      # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
      variant :document, -> { Anthropic::DocumentBlockParam }

      # A block specifying internal thinking by the model.
      variant :thinking, -> { Anthropic::ThinkingBlockParam }

      # A block specifying internal, redacted thinking by the model.
      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam)]
    end
  end
end
