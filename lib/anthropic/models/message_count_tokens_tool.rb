# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # @example
    # ```ruby
    # case message_count_tokens_tool
    # in Anthropic::Models::ToolBash20250124
    #   # ...
    # in Anthropic::Models::ToolTextEditor20250124
    #   # ...
    # in Anthropic::Models::Tool
    #   # ...
    # end
    # ```
    class MessageCountTokensTool < Anthropic::Union
      variant -> { Anthropic::Models::ToolBash20250124 }

      variant -> { Anthropic::Models::ToolTextEditor20250124 }

      variant -> { Anthropic::Models::Tool }
    end
  end
end
