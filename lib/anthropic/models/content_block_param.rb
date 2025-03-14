# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    class ContentBlockParam < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlockParam }

      variant :tool_result, -> { Anthropic::Models::ToolResultBlockParam }

      variant :document, -> { Anthropic::Models::DocumentBlockParam }

      variant :thinking, -> { Anthropic::Models::ThinkingBlockParam }

      variant :redacted_thinking, -> { Anthropic::Models::RedactedThinkingBlockParam }
    end
  end
end
