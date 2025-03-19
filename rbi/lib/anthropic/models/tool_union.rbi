# typed: strong

module Anthropic
  module Models
    class ToolUnion < Anthropic::Union
      abstract!

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::Tool,
              Anthropic::Models::ToolBash20250124,
              Anthropic::Models::ToolTextEditor20250124
            )
          }
        end
    end
  end
end
