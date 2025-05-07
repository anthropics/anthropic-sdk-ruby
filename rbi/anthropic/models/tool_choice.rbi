# typed: strong

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    # any available tool, decide by itself, or not use tools at all.
    module ToolChoice
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::ToolChoiceAuto,
            Anthropic::ToolChoiceAny,
            Anthropic::ToolChoiceTool,
            Anthropic::ToolChoiceNone
          )
        end

      sig { override.returns(T::Array[Anthropic::ToolChoice::Variants]) }
      def self.variants
      end
    end
  end
end
