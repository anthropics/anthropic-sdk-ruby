# frozen_string_literal: true

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    # any available tool, decide by itself, or not use tools at all.
    module ToolChoice
      extend Anthropic::Internal::Type::Union

      discriminator :type

      # The model will automatically decide whether to use tools.
      variant :auto, -> { Anthropic::ToolChoiceAuto }

      # The model will use any available tools.
      variant :any, -> { Anthropic::ToolChoiceAny }

      # The model will use the specified tool with `tool_choice.name`.
      variant :tool, -> { Anthropic::ToolChoiceTool }

      # The model will not be allowed to use tools.
      variant :none, -> { Anthropic::ToolChoiceNone }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone)]
    end
  end
end
