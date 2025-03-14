# typed: strong

module Anthropic
  module Models
    BetaToolUnion = T.type_alias { Beta::BetaToolUnion }

    module Beta
      class BetaToolUnion < Anthropic::Union
        abstract!

        class << self
          # @api private
          sig do
            override
              .returns(
                [[NilClass, Anthropic::Models::Beta::BetaTool], [NilClass, Anthropic::Models::Beta::BetaToolComputerUse20241022], [NilClass, Anthropic::Models::Beta::BetaToolBash20241022], [NilClass, Anthropic::Models::Beta::BetaToolTextEditor20241022], [NilClass, Anthropic::Models::Beta::BetaToolComputerUse20250124], [NilClass, Anthropic::Models::Beta::BetaToolBash20250124], [NilClass, Anthropic::Models::Beta::BetaToolTextEditor20250124]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
