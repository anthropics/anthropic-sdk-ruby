# frozen_string_literal: true

module Anthropic
  module Models
    module MessageCountTokensTool
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::Tool }

      variant -> { Anthropic::ToolBash20250124 }

      variant -> { Anthropic::ToolTextEditor20250124 }

      variant -> { Anthropic::WebSearchTool20250305 }

      # @!method self.variants
      #   @return [Array(Anthropic::Tool, Anthropic::ToolBash20250124, Anthropic::ToolTextEditor20250124, Anthropic::WebSearchTool20250305)]

      define_sorbet_constant!(:Variants) do
        T.type_alias do
          T.any(
            Anthropic::Tool,
            Anthropic::ToolBash20250124,
            Anthropic::ToolTextEditor20250124,
            Anthropic::WebSearchTool20250305
          )
        end
      end
    end
  end
end
