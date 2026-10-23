# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsUsageCostInferenceGeo
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GLOBAL =
            T.let(
              :global,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo::TaggedSymbol
            )
          US =
            T.let(
              :us,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo::TaggedSymbol
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
