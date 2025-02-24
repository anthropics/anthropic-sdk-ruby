# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # @example
    # ```ruby
    # case content_block
    # in {type: "text", citations: ^(Anthropic::ArrayOf[union: Anthropic::Models::TextCitation]), text: String}
    #   # Anthropic::Models::TextBlock ...
    # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
    #   # Anthropic::Models::ToolUseBlock ...
    # in {type: "thinking", signature: String, thinking: String}
    #   # Anthropic::Models::ThinkingBlock ...
    # in {type: "redacted_thinking", data: String}
    #   # Anthropic::Models::RedactedThinkingBlock ...
    # end
    # ```
    #
    # @example
    # ```ruby
    # case content_block
    # in Anthropic::Models::TextBlock
    #   # ...
    # in Anthropic::Models::ToolUseBlock
    #   # ...
    # in Anthropic::Models::ThinkingBlock
    #   # ...
    # in Anthropic::Models::RedactedThinkingBlock
    #   # ...
    # end
    # ```
    class ContentBlock < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlock }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlock }

      variant :thinking, -> { Anthropic::Models::ThinkingBlock }

      variant :redacted_thinking, -> { Anthropic::Models::RedactedThinkingBlock }
    end
  end
end
