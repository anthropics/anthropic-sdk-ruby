# typed: strong

module Anthropic
  module Models
    BetaToolUnion = T.type_alias { Beta::BetaToolUnion }

    module Beta
      class BetaToolUnion < Anthropic::Union
        abstract!

        sig do
          override
            .returns(
              [[NilClass, Anthropic::Models::Beta::BetaTool], [NilClass, Anthropic::Models::Beta::BetaToolComputerUse20241022], [NilClass, Anthropic::Models::Beta::BetaToolBash20241022], [NilClass, Anthropic::Models::Beta::BetaToolTextEditor20241022]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
