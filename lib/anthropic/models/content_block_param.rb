# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlockParam }

      variant :image, -> { Anthropic::ImageBlockParam }

      variant :tool_use, -> { Anthropic::ToolUseBlockParam }

      variant :tool_result, -> { Anthropic::ToolResultBlockParam }

      variant :document, -> { Anthropic::DocumentBlockParam }

      variant :thinking, -> { Anthropic::ThinkingBlockParam }

      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::TextBlockParam, Anthropic::ImageBlockParam, Anthropic::ToolUseBlockParam, Anthropic::ToolResultBlockParam, Anthropic::DocumentBlockParam, Anthropic::ThinkingBlockParam, Anthropic::RedactedThinkingBlockParam)]
    end
  end
end
