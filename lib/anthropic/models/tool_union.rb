# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # @example
    # ```ruby
    # case tool_union
    # in Anthropic::Models::ToolBash20250124
    #   # ...
    # in Anthropic::Models::ToolTextEditor20250124
    #   # ...
    # in Anthropic::Models::Tool
    #   # ...
    # end
    # ```
    class ToolUnion < Anthropic::Union
      variant -> { Anthropic::Models::ToolBash20250124 }

      variant -> { Anthropic::Models::ToolTextEditor20250124 }

      variant -> { Anthropic::Models::Tool }
    end
  end
end
