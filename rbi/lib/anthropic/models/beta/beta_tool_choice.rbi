# typed: strong

module Anthropic
  module Models
    module Beta
      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      module BetaToolChoice
        extend Anthropic::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
            )
        end
        def self.variants
        end
      end
    end

    BetaToolChoice = Beta::BetaToolChoice
  end
end
