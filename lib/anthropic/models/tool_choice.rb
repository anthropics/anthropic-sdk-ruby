# frozen_string_literal: true

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    #   any available tool, decide by itself, or not use tools at all.
    module ToolChoice
      extend Anthropic::Union

      discriminator :type

      # The model will automatically decide whether to use tools.
      variant :auto, -> { Anthropic::Models::ToolChoiceAuto }

      # The model will use any available tools.
      variant :any, -> { Anthropic::Models::ToolChoiceAny }

      # The model will use the specified tool with `tool_choice.name`.
      variant :tool, -> { Anthropic::Models::ToolChoiceTool }

      # The model will not be allowed to use tools.
      variant :none, -> { Anthropic::Models::ToolChoiceNone }

      # @!parse
      #   # @return [Array(Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone)]
      #   def self.variants; end
    end
  end
end
