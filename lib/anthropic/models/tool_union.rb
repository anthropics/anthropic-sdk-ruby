# frozen_string_literal: true

module Anthropic
  module Models
    module ToolUnion
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::Models::Tool }

      variant -> { Anthropic::Models::ToolBash20250124 }

      variant -> { Anthropic::Models::ToolTextEditor20250124 }

      # @!parse
      #   # @return [Array(Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124)]
      #   def self.variants; end
    end
  end
end
