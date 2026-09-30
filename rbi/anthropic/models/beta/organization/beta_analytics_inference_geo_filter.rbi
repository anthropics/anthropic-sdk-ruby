# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsInferenceGeoFilter
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GLOBAL =
            T.let(
              :global,
              Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter::TaggedSymbol
            )
          NOT_AVAILABLE =
            T.let(
              :not_available,
              Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter::TaggedSymbol
            )
          US =
            T.let(
              :us,
              Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter::TaggedSymbol
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
