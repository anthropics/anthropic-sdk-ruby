# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlock
      extend Anthropic::Union

      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlock }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlock }

      variant :thinking, -> { Anthropic::Models::ThinkingBlock }

      variant :redacted_thinking, -> { Anthropic::Models::RedactedThinkingBlock }

      # @!parse
      #   # @return [Array(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock)]
      #   def self.variants; end
    end
  end
end
