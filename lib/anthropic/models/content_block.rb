# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlock }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlock }

      variant :thinking, -> { Anthropic::Models::ThinkingBlock }

      variant :redacted_thinking, -> { Anthropic::Models::RedactedThinkingBlock }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock)]
    end
  end
end
