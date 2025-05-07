# frozen_string_literal: true

module Anthropic
  module Models
    module MessageCountTokensTool
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::Tool }

      variant -> { Anthropic::ToolBash20250124 }

      variant -> { Anthropic::ToolTextEditor20250124 }

      # @!method self.variants
      #   @return [Array(Anthropic::Tool, Anthropic::ToolBash20250124, Anthropic::ToolTextEditor20250124)]
    end
  end
end
