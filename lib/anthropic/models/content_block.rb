# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlock }

      variant :tool_use, -> { Anthropic::ToolUseBlock }

      variant :thinking, -> { Anthropic::ThinkingBlock }

      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlock }

      # @!method self.variants
      #   @return [Array(Anthropic::TextBlock, Anthropic::ToolUseBlock, Anthropic::ThinkingBlock, Anthropic::RedactedThinkingBlock)]
    end
  end
end
