# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsUsageCostSortOrder
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsUsageCostSortOrder
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ASC =
            T.let(
              :asc,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostSortOrder::TaggedSymbol
            )
          DESC =
            T.let(
              :desc,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostSortOrder::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsUsageCostSortOrder::TaggedSymbol
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
