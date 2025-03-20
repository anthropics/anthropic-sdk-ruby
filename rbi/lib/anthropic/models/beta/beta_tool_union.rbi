# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaToolUnion
        extend Anthropic::Union

        Variants =
          type_template(:out) do
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

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124]
              )
          end
          def variants
          end
        end
      end
    end

    BetaToolUnion = Beta::BetaToolUnion
  end
end
