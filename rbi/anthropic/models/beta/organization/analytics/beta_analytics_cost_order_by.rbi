# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          module BetaAnalyticsCostOrderBy
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AMOUNT =
              T.let(
                :amount,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy::TaggedSymbol
              )
            LIST_AMOUNT =
              T.let(
                :list_amount,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy::TaggedSymbol
              )
            TIME =
              T.let(
                :time,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy::TaggedSymbol
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
