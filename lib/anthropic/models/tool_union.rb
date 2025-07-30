# frozen_string_literal: true

module Anthropic
  module Models
    module ToolUnion
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::Tool }

      variant -> { Anthropic::ToolBash20250124 }

      variant -> { Anthropic::ToolTextEditor20250124 }

      variant -> { Anthropic::ToolTextEditor20250429 }

      variant -> { Anthropic::ToolTextEditor20250728 }

      variant -> { Anthropic::WebSearchTool20250305 }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305)]
    end
  end
end
