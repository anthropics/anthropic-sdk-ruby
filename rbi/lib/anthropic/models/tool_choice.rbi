# typed: strong

module Anthropic
  module Models
    class ToolChoice < Anthropic::Union
      abstract!

      sig do
        override
          .returns(
            [[Symbol, Anthropic::Models::ToolChoiceAuto], [Symbol, Anthropic::Models::ToolChoiceAny], [Symbol, Anthropic::Models::ToolChoiceTool]]
          )
      end
      private_class_method def self.variants
      end
    end
  end
end
