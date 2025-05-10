# typed: strong

module Anthropic
  module Models
    module MessageCountTokensTool
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

      sig do
        override.returns(T::Array[Anthropic::MessageCountTokensTool::Variants])
      end
      def self.variants
      end
    end
  end
end
