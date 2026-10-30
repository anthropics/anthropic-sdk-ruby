# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Sort direction: `asc` or `desc`. Defaults to `asc` for the endpoint's sort
        # column and to `desc` when `order_by` names a metric (a top-N ranking). Applies
        # to `order_by`, or to the endpoint's default sort field when `order_by` is
        # omitted.
        module BetaAnalyticsOrder
          extend Anthropic::Internal::Type::Enum

          ASC = :asc
          DESC = :desc

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
