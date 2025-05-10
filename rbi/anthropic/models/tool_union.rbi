# typed: strong

module Anthropic
  module Models
    module ToolUnion
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::Tool,
            Anthropic::ToolBash20250124,
            Anthropic::ToolTextEditor20250124,
            Anthropic::WebSearchTool20250305
          )
        end

      sig { override.returns(T::Array[Anthropic::ToolUnion::Variants]) }
      def self.variants
      end
    end
  end
end
