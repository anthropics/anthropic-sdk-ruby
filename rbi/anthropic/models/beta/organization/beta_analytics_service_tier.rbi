# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsServiceTier
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsServiceTier
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BATCH =
            T.let(
              :batch,
              Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
            )
          FLEX =
            T.let(
              :flex,
              Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
            )
          FLEX_DISCOUNT =
            T.let(
              :flex_discount,
              Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
            )
          PRIORITY =
            T.let(
              :priority,
              Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
            )
          PRIORITY_ON_DEMAND =
            T.let(
              :priority_on_demand,
              Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
            )
          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
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
