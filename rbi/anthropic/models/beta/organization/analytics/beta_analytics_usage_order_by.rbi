# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          module BetaAnalyticsUsageOrderBy
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageOrderBy
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            OUTPUT_TOKENS =
              T.let(
                :output_tokens,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageOrderBy::TaggedSymbol
              )
            REQUESTS =
              T.let(
                :requests,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageOrderBy::TaggedSymbol
              )
            TIME =
              T.let(
                :time,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageOrderBy::TaggedSymbol
              )
            TOTAL_TOKENS =
              T.let(
                :total_tokens,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageOrderBy::TaggedSymbol
              )
            UNCACHED_INPUT_TOKENS =
              T.let(
                :uncached_input_tokens,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageOrderBy::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageOrderBy::TaggedSymbol
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
end
