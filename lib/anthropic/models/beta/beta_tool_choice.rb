# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # How the model should use the provided tools. The model can use a specific tool, any available tool, or decide by itself.
      #
      # @example
      #
      # ```ruby
      # case union
      # in Anthropic::Models::Beta::BetaToolChoiceAuto
      #   # ...
      # in Anthropic::Models::Beta::BetaToolChoiceAny
      #   # ...
      # in Anthropic::Models::Beta::BetaToolChoiceTool
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
      end
    end

    BetaToolChoice = Beta::BetaToolChoice
  end
end
