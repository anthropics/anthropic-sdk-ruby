# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsGroupedCostType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsGroupedCostType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CODE_EXECUTION =
            T.let(
              :code_execution,
              Anthropic::Beta::Organization::BetaAnalyticsGroupedCostType::TaggedSymbol
            )
          SESSION_USAGE =
            T.let(
              :session_usage,
              Anthropic::Beta::Organization::BetaAnalyticsGroupedCostType::TaggedSymbol
            )
          TOKENS =
            T.let(
              :tokens,
              Anthropic::Beta::Organization::BetaAnalyticsGroupedCostType::TaggedSymbol
            )
          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::Organization::BetaAnalyticsGroupedCostType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsGroupedCostType::TaggedSymbol
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
