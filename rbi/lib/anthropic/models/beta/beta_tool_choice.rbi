# typed: strong

module Anthropic
  module Models
    BetaToolChoice = T.type_alias { Beta::BetaToolChoice }

    module Beta
      class BetaToolChoice < Anthropic::Union
        abstract!

        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::Beta::BetaToolChoiceAuto], [Symbol, Anthropic::Models::Beta::BetaToolChoiceAny], [Symbol, Anthropic::Models::Beta::BetaToolChoiceTool], [Symbol, Anthropic::Models::Beta::BetaToolChoiceNone]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
