# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          module BetaSpendLimitIncreaseRequestStatus
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            APPROVED =
              T.let(
                :approved,
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::TaggedSymbol
              )
            DENIED =
              T.let(
                :denied,
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::TaggedSymbol
              )
            PENDING =
              T.let(
                :pending,
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::TaggedSymbol
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
