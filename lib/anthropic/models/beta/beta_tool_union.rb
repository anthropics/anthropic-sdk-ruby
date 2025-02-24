# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # @example
      # ```ruby
      # case beta_tool_union
      # in Anthropic::Models::Beta::BetaToolComputerUse20241022
      #   # ...
      # in Anthropic::Models::Beta::BetaToolBash20241022
      #   # ...
      # in Anthropic::Models::Beta::BetaToolTextEditor20241022
      #   # ...
      # in Anthropic::Models::Beta::BetaToolComputerUse20250124
      #   # ...
      # in Anthropic::Models::Beta::BetaToolBash20250124
      #   # ...
      # in Anthropic::Models::Beta::BetaToolTextEditor20250124
      #   # ...
      # in Anthropic::Models::Beta::BetaTool
      #   # ...
      # end
      # ```
      class BetaToolUnion < Anthropic::Union
        variant -> { Anthropic::Models::Beta::BetaToolComputerUse20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolBash20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolTextEditor20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolComputerUse20250124 }

        variant -> { Anthropic::Models::Beta::BetaToolBash20250124 }

        variant -> { Anthropic::Models::Beta::BetaToolTextEditor20250124 }

        variant -> { Anthropic::Models::Beta::BetaTool }
      end
    end

    BetaToolUnion = Beta::BetaToolUnion
  end
end
