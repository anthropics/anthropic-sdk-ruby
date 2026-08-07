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

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: T.any(Symbol, String),
          disable_parallel_tool_use: T::Boolean,
          name: String
        ).returns(Anthropic::ToolChoice::Variants)
      end
      def self.new(
        type:,
        # Whether to disable parallel tool use.
        #
        # Defaults to `false`. If set to `true`, the model will output at most one tool
        # use.
        disable_parallel_tool_use: nil,
        # The name of the tool to use.
        name: nil
      )
      end
    end
  end
end
