# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    class MessageCountTokensTool < Anthropic::Union
      variant -> { Anthropic::Models::Tool }

      variant -> { Anthropic::Models::ToolBash20250124 }

      variant -> { Anthropic::Models::ToolTextEditor20250124 }
    end
  end
end
