# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # @example
    # ```ruby
    # case tool_union
    # in Anthropic::Models::Tool
    #   # ...
    # in Anthropic::Models::ToolBash20250124
    #   # ...
    # in Anthropic::Models::ToolTextEditor20250124
    #   # ...
    # end
    # ```
    class ToolUnion < Anthropic::Union
      variant -> { Anthropic::Models::Tool }

      variant -> { Anthropic::Models::ToolBash20250124 }

      variant -> { Anthropic::Models::ToolTextEditor20250124 }
    end
  end
end
