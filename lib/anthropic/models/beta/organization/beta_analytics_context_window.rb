# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsContextWindow
          extend Anthropic::Internal::Type::Enum

          FROM_0_TO_200K = :"0-200k"
          FROM_200K_TO_1_M = :"200k-1M"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
