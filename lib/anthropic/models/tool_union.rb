# frozen_string_literal: true

module Anthropic
  module Models
    # Code execution tool with REPL state persistence (daemon mode + gVisor
    # checkpoint).
    module ToolUnion
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::Tool }

      variant -> { Anthropic::ToolBash20250124 }

      variant -> { Anthropic::CodeExecutionTool20250522 }

      variant -> { Anthropic::CodeExecutionTool20250825 }

      # Code execution tool with REPL state persistence (daemon mode + gVisor checkpoint).
      variant -> { Anthropic::CodeExecutionTool20260120 }

      variant -> { Anthropic::MemoryTool20250818 }

      variant -> { Anthropic::ToolTextEditor20250124 }

      variant -> { Anthropic::ToolTextEditor20250429 }

      variant -> { Anthropic::ToolTextEditor20250728 }

      variant -> { Anthropic::WebSearchTool20250305 }

      variant -> { Anthropic::WebFetchTool20250910 }

      variant -> { Anthropic::WebSearchTool20260209 }

      variant -> { Anthropic::WebFetchTool20260209 }

      variant -> { Anthropic::ToolSearchToolBm25_20251119 }

      variant -> { Anthropic::ToolSearchToolRegex20251119 }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119)]
    end
  end
end
