# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaSpendLimitPeriod
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::Organization::BetaSpendLimitPeriod)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DAILY =
            T.let(
              :daily,
              Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol
            )
          MONTHLY =
            T.let(
              :monthly,
              Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol
            )
          WEEKLY =
            T.let(
              :weekly,
              Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol
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
