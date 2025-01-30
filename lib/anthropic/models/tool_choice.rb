# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # How the model should use the provided tools. The model can use a specific tool,
    #   any available tool, or decide by itself.
    #
    # @example
    # ```ruby
    # case tool_choice
    # in {type: "auto", disable_parallel_tool_use: Anthropic::BooleanModel}
    #   # Anthropic::Models::ToolChoiceAuto ...
    # in {type: "any", disable_parallel_tool_use: Anthropic::BooleanModel}
    #   # Anthropic::Models::ToolChoiceAny ...
    # in {type: "tool", name: String, disable_parallel_tool_use: Anthropic::BooleanModel}
    #   # Anthropic::Models::ToolChoiceTool ...
    # end
    # ```
    #
    # @example
    # ```ruby
    # case tool_choice
    # in Anthropic::Models::ToolChoiceAuto
    #   # ...
    # in Anthropic::Models::ToolChoiceAny
    #   # ...
    # in Anthropic::Models::ToolChoiceTool
    #   # ...
    # end
    # ```
    class ToolChoice < Anthropic::Union
      discriminator :type

      # The model will automatically decide whether to use tools.
      variant :auto, -> { Anthropic::Models::ToolChoiceAuto }

      # The model will use any available tools.
      variant :any, -> { Anthropic::Models::ToolChoiceAny }

      # The model will use the specified tool with `tool_choice.name`.
      variant :tool, -> { Anthropic::Models::ToolChoiceTool }
    end
  end
end
