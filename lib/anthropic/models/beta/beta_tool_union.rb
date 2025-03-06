# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      class BetaToolUnion < Anthropic::Union
        variant -> { Anthropic::Models::Beta::BetaTool }

        variant -> { Anthropic::Models::Beta::BetaToolComputerUse20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolBash20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolTextEditor20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolComputerUse20250124 }

        variant -> { Anthropic::Models::Beta::BetaToolBash20250124 }

        variant -> { Anthropic::Models::Beta::BetaToolTextEditor20250124 }
      end
    end

    BetaToolUnion = Beta::BetaToolUnion
  end
end
