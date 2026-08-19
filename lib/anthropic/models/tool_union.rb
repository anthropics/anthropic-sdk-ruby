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

      # Code execution tool with REPL state persistence.
      variant -> { Anthropic::CodeExecutionTool20260521 }

      # The browser toolset: a single ``tools[]`` entry (carrying no
      # ``name``) that declares the browser tool family. The model is served
      # the family's tool with any members disabled via ``configs`` removed
      # from its schema.
      variant -> { Anthropic::BrowserToolset20260801 }

      variant -> { Anthropic::MemoryTool20250818 }

      # The computer toolset: a single ``tools[]`` entry (carrying no
      # ``name``) that declares the computer tool family. The model is
      # served the family's tool with any members disabled via ``configs``
      # removed from its schema. Every member is enabled by default, zoom
      # included. The single-tool options ``display_number`` and
      # ``enable_zoom`` are not fields of a toolset entry — it carries only
      # ``type``, ``configs``, and ``cache_control``; zoom is controlled
      # via ``configs.zoom.enabled``.
      variant -> { Anthropic::ComputerToolset20260801 }

      variant -> { Anthropic::ToolTextEditor20250124 }

      variant -> { Anthropic::ToolTextEditor20250429 }

      variant -> { Anthropic::ToolTextEditor20250728 }

      variant -> { Anthropic::WebSearchTool20250305 }

      variant -> { Anthropic::WebFetchTool20250910 }

      variant -> { Anthropic::WebSearchTool20260209 }

      variant -> { Anthropic::WebFetchTool20260209 }

      # Web fetch tool with use_cache parameter for bypassing cached content.
      variant -> { Anthropic::WebFetchTool20260309 }

      variant -> { Anthropic::WebSearchTool20260318 }

      variant -> { Anthropic::WebFetchTool20260318 }

      variant -> { Anthropic::ToolSearchToolBm25_20251119 }

      variant -> { Anthropic::ToolSearchToolRegex20251119 }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::BrowserToolset20260801, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ComputerToolset20260801, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119)]
    end
  end
end
