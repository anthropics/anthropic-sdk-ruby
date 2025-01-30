# typed: strong

module Anthropic
  module Models
    class ToolChoice < Anthropic::Union
      abstract!

      Variants = T.type_alias do
        T.any(
          Anthropic::Models::ToolChoiceAuto,
          Anthropic::Models::ToolChoiceAny,
          Anthropic::Models::ToolChoiceTool
        )
      end

      sig do
        override.returns(
          [
            [Symbol, Anthropic::Models::ToolChoiceAuto],
            [Symbol, Anthropic::Models::ToolChoiceAny],
            [Symbol, Anthropic::Models::ToolChoiceTool]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
