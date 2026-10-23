# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsTimeBucketWidth
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsTimeBucketWidth
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DAY =
            T.let(
              :"1d",
              Anthropic::Beta::Organization::BetaAnalyticsTimeBucketWidth::TaggedSymbol
            )
          HOUR =
            T.let(
              :"1h",
              Anthropic::Beta::Organization::BetaAnalyticsTimeBucketWidth::TaggedSymbol
            )
          MINUTE =
            T.let(
              :"1m",
              Anthropic::Beta::Organization::BetaAnalyticsTimeBucketWidth::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsTimeBucketWidth::TaggedSymbol
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
