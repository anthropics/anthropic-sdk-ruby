# typed: strong

module Anthropic
  module Models
    BetaToolChoice = T.type_alias { Beta::BetaToolChoice }

    module Beta
      class BetaToolChoice < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::Beta::BetaToolChoiceAuto,
            Anthropic::Models::Beta::BetaToolChoiceAny,
            Anthropic::Models::Beta::BetaToolChoiceTool
          )
        end

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::Beta::BetaToolChoiceAuto],
              [Symbol, Anthropic::Models::Beta::BetaToolChoiceAny],
              [Symbol, Anthropic::Models::Beta::BetaToolChoiceTool]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
