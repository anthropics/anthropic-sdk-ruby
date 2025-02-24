# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigParam = T.type_alias { Beta::BetaThinkingConfigParam }

    module Beta
      class BetaThinkingConfigParam < Anthropic::Union
        abstract!

        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::Beta::BetaThinkingConfigEnabled], [Symbol, Anthropic::Models::Beta::BetaThinkingConfigDisabled]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
