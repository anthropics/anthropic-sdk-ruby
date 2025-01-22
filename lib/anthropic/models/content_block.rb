# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # case content_block
    # in {type: "text", text: String}
    #   # Anthropic::Models::TextBlock ...
    # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
    #   # Anthropic::Models::ToolUseBlock ...
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
    # end
    # ```
    class ContentBlock < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlock }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlock }
    end
  end
end
