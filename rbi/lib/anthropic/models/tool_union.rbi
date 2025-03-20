# typed: strong

module Anthropic
  module Models
    module ToolUnion
      extend Anthropic::Union

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
