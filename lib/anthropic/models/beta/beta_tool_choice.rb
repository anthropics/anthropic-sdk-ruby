# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      #
      # @example
      # ```ruby
      # case beta_tool_choice
      # in {type: "auto", disable_parallel_tool_use: Anthropic::BooleanModel}
      #   # Anthropic::Models::Beta::BetaToolChoiceAuto ...
      # in {type: "any", disable_parallel_tool_use: Anthropic::BooleanModel}
      #   # Anthropic::Models::Beta::BetaToolChoiceAny ...
      # in {type: "tool", name: String, disable_parallel_tool_use: Anthropic::BooleanModel}
      #   # Anthropic::Models::Beta::BetaToolChoiceTool ...
      # in {type: "none"}
      #   # Anthropic::Models::Beta::BetaToolChoiceNone ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case beta_tool_choice
      # in Anthropic::Models::Beta::BetaToolChoiceAuto
      #   # ...
      # in Anthropic::Models::Beta::BetaToolChoiceAny
      #   # ...
      # in Anthropic::Models::Beta::BetaToolChoiceTool
      #   # ...
      # in Anthropic::Models::Beta::BetaToolChoiceNone
      #   # ...
      # end
      # ```
      class BetaToolChoice < Anthropic::Union
        discriminator :type

        # The model will automatically decide whether to use tools.
        variant :auto, -> { Anthropic::Models::Beta::BetaToolChoiceAuto }

        # The model will use any available tools.
        variant :any, -> { Anthropic::Models::Beta::BetaToolChoiceAny }

        # The model will use the specified tool with `tool_choice.name`.
        variant :tool, -> { Anthropic::Models::Beta::BetaToolChoiceTool }

        # The model will not be allowed to use tools.
        variant :none, -> { Anthropic::Models::Beta::BetaToolChoiceNone }
      end
    end

    BetaToolChoice = Beta::BetaToolChoice
  end
end
