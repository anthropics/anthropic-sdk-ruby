# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Code execution tool with REPL state persistence (daemon mode + gVisor
      # checkpoint).
      module BetaToolUnion
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaTool }

        variant -> { Anthropic::Beta::BetaToolBash20241022 }

        variant -> { Anthropic::Beta::BetaToolBash20250124 }

        variant -> { Anthropic::Beta::BetaCodeExecutionTool20250522 }

        variant -> { Anthropic::Beta::BetaCodeExecutionTool20250825 }

        # Code execution tool with REPL state persistence (daemon mode + gVisor checkpoint).
        variant -> { Anthropic::Beta::BetaCodeExecutionTool20260120 }

        variant -> { Anthropic::Beta::BetaToolComputerUse20241022 }

        variant -> { Anthropic::Beta::BetaMemoryTool20250818 }

        variant -> { Anthropic::Beta::BetaToolComputerUse20250124 }

        variant -> { Anthropic::Beta::BetaToolTextEditor20241022 }

        variant -> { Anthropic::Beta::BetaToolComputerUse20251124 }

        variant -> { Anthropic::Beta::BetaToolTextEditor20250124 }

        variant -> { Anthropic::Beta::BetaToolTextEditor20250429 }

        variant -> { Anthropic::Beta::BetaToolTextEditor20250728 }

        variant -> { Anthropic::Beta::BetaWebSearchTool20250305 }

        variant -> { Anthropic::Beta::BetaWebFetchTool20250910 }

        variant -> { Anthropic::Beta::BetaWebSearchTool20260209 }

        variant -> { Anthropic::Beta::BetaWebFetchTool20260209 }

        variant -> { Anthropic::Beta::BetaToolSearchToolBm25_20251119 }

        variant -> { Anthropic::Beta::BetaToolSearchToolRegex20251119 }

        # Configuration for a group of tools from an MCP server.
        #
        # Allows configuring enabled status and defer_loading for all tools
        # from an MCP server, with optional per-tool overrides.
        variant -> { Anthropic::Beta::BetaMCPToolset }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaCodeExecutionTool20250522, Anthropic::Models::Beta::BetaCodeExecutionTool20250825, Anthropic::Models::Beta::BetaCodeExecutionTool20260120, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaMemoryTool20250818, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20251124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaToolTextEditor20250728, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaWebFetchTool20250910, Anthropic::Models::Beta::BetaWebSearchTool20260209, Anthropic::Models::Beta::BetaWebFetchTool20260209, Anthropic::Models::Beta::BetaToolSearchToolBm25_20251119, Anthropic::Models::Beta::BetaToolSearchToolRegex20251119, Anthropic::Models::Beta::BetaMCPToolset)]
      end
    end

    BetaToolUnion = Beta::BetaToolUnion
  end
end
