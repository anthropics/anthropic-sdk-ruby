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
          # @api private
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Beta::BetaToolChoiceAuto], [Symbol, Anthropic::Models::Beta::BetaToolChoiceAny], [Symbol, Anthropic::Models::Beta::BetaToolChoiceTool], [Symbol, Anthropic::Models::Beta::BetaToolChoiceNone]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
