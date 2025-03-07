# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigParam = T.type_alias { Beta::BetaThinkingConfigParam }

    module Beta
      class BetaThinkingConfigParam < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Beta::BetaThinkingConfigEnabled], [Symbol, Anthropic::Models::Beta::BetaThinkingConfigDisabled]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
