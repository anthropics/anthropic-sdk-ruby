# typed: strong

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    #   any available tool, decide by itself, or not use tools at all.
    class ToolChoice < Anthropic::Union
      abstract!

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::ToolChoiceAuto,
              Anthropic::Models::ToolChoiceAny,
              Anthropic::Models::ToolChoiceTool,
              Anthropic::Models::ToolChoiceNone
            )
          }
        end
    end
  end
end
