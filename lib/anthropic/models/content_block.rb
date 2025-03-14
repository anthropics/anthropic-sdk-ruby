# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    class ContentBlock < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlock }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlock }

      variant :thinking, -> { Anthropic::Models::ThinkingBlock }

      variant :redacted_thinking, -> { Anthropic::Models::RedactedThinkingBlock }
    end
  end
end
