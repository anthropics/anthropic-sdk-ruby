# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case union
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
