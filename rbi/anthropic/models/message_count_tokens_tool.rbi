# typed: strong

module Anthropic
  module Models
    # Code execution tool with REPL state persistence (daemon mode + gVisor
    # checkpoint).
    module MessageCountTokensTool
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::Tool,
            Anthropic::ToolBash20250124,
            Anthropic::CodeExecutionTool20250522,
            Anthropic::CodeExecutionTool20250825,
            Anthropic::CodeExecutionTool20260120,
            Anthropic::MemoryTool20250818,
            Anthropic::ToolTextEditor20250124,
            Anthropic::ToolTextEditor20250429,
            Anthropic::ToolTextEditor20250728,
            Anthropic::WebSearchTool20250305,
            Anthropic::WebFetchTool20250910,
            Anthropic::WebSearchTool20260209,
            Anthropic::WebFetchTool20260209,
            Anthropic::ToolSearchToolBm25_20251119,
            Anthropic::ToolSearchToolRegex20251119
          )
        end

      sig do
        override.returns(T::Array[Anthropic::MessageCountTokensTool::Variants])
      end
      def self.variants
      end
    end
  end
end
