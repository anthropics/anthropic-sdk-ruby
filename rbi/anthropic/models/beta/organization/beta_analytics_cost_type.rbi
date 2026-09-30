# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsCostType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsCostType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CODE_EXECUTION =
            T.let(
              :code_execution,
              Anthropic::Beta::Organization::BetaAnalyticsCostType::TaggedSymbol
            )
          TOKENS =
            T.let(
              :tokens,
              Anthropic::Beta::Organization::BetaAnalyticsCostType::TaggedSymbol
            )
          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::Organization::BetaAnalyticsCostType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsCostType::TaggedSymbol
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
