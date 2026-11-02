# typed: strong

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

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::Organization::BetaAnalyticsOrder)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ASC =
            T.let(
              :asc,
              Anthropic::Beta::Organization::BetaAnalyticsOrder::TaggedSymbol
            )
          DESC =
            T.let(
              :desc,
              Anthropic::Beta::Organization::BetaAnalyticsOrder::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsOrder::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
