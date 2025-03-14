# typed: strong

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    #   any available tool, decide by itself, or not use tools at all.
    class ToolChoice < Anthropic::Union
      abstract!

      class << self
        # @api private
        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::ToolChoiceAuto], [Symbol, Anthropic::Models::ToolChoiceAny], [Symbol, Anthropic::Models::ToolChoiceTool], [Symbol, Anthropic::Models::ToolChoiceNone]]
            )
        end
        private def variants
        end
      end
    end
  end
end
