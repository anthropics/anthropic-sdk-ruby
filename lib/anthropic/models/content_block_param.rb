# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlockParam }

      variant :tool_result, -> { Anthropic::Models::ToolResultBlockParam }

      variant :document, -> { Anthropic::Models::DocumentBlockParam }

      variant :thinking, -> { Anthropic::Models::ThinkingBlockParam }

      variant :redacted_thinking, -> { Anthropic::Models::RedactedThinkingBlockParam }

      # @!parse
      #   # @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam)]
      #   def self.variants; end
    end
  end
end
