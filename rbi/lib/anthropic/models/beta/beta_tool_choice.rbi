# typed: strong

module Anthropic
  module Models
    BetaToolChoice = T.type_alias { Beta::BetaToolChoice }

    module Beta
      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      class BetaToolChoice < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
