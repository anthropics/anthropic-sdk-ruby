# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsServiceTier
          extend Anthropic::Internal::Type::Enum

          BATCH = :batch
          FLEX = :flex
          FLEX_DISCOUNT = :flex_discount
          PRIORITY = :priority
          PRIORITY_ON_DEMAND = :priority_on_demand
          STANDARD = :standard

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
