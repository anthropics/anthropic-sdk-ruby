# typed: strong

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    #   any available tool, decide by itself, or not use tools at all.
    module ToolChoice
      extend Anthropic::Internal::Type::Union

      sig do
        override
          .returns(
            [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone]
          )
      end
      def self.variants
      end
    end
  end
end
