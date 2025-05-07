# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaToolUnion
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaTool }

        variant -> { Anthropic::Beta::BetaToolComputerUse20241022 }

        variant -> { Anthropic::Beta::BetaToolBash20241022 }

        variant -> { Anthropic::Beta::BetaToolTextEditor20241022 }

        variant -> { Anthropic::Beta::BetaToolComputerUse20250124 }

        variant -> { Anthropic::Beta::BetaToolBash20250124 }

        variant -> { Anthropic::Beta::BetaToolTextEditor20250124 }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaTool, Anthropic::Beta::BetaToolComputerUse20241022, Anthropic::Beta::BetaToolBash20241022, Anthropic::Beta::BetaToolTextEditor20241022, Anthropic::Beta::BetaToolComputerUse20250124, Anthropic::Beta::BetaToolBash20250124, Anthropic::Beta::BetaToolTextEditor20250124)]
      end
    end

    BetaToolUnion = Beta::BetaToolUnion
  end
end
