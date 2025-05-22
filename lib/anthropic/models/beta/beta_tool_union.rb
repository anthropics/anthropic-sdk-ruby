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

        variant -> { Anthropic::Beta::BetaToolTextEditor20250429 }

        variant -> { Anthropic::Beta::BetaWebSearchTool20250305 }

        variant -> { Anthropic::Beta::BetaCodeExecutionTool20250522 }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaCodeExecutionTool20250522)]
      end
    end

    BetaToolUnion = Beta::BetaToolUnion
  end
end
