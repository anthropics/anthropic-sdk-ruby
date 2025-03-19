# typed: strong

module Anthropic
  module Models
    module Beta
      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      class BetaToolChoice < Anthropic::Union
        abstract!

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool,
                Anthropic::Models::Beta::BetaToolChoiceNone
              )
            }
          end
      end
    end

    BetaToolChoice = Beta::BetaToolChoice
  end
end
