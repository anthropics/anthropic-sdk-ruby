# typed: strong

module Anthropic
  module Models
    class ToolChoice < Anthropic::Union
      abstract!

      class << self
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
