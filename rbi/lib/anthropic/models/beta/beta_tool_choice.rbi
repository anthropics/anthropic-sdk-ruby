# typed: strong

module Anthropic
  module Models
    BetaToolChoice = T.type_alias { Beta::BetaToolChoice }

    module Beta
      class BetaToolChoice < Anthropic::Union
        abstract!

        class << self
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
