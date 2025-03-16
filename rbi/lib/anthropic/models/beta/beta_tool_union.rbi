# typed: strong

module Anthropic
  module Models
    BetaToolUnion = T.type_alias { Beta::BetaToolUnion }

    module Beta
      class BetaToolUnion < Anthropic::Union
        abstract!

        Variants = type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
          }
        end
      end
    end
  end
end
