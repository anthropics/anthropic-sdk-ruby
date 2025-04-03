# typed: strong

module Anthropic
  module Models
    module ToolUnion
      extend Anthropic::Internal::Type::Union

      sig do
        override
          .returns(
            [Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::ToolTextEditor20250124]
          )
      end
      def self.variants
      end
    end
  end
end
