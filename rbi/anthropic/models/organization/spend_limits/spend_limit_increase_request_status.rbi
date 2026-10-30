# typed: strong

module Anthropic
  module Models
    module Organization
      SpendLimitIncreaseRequestStatus =
        SpendLimits::SpendLimitIncreaseRequestStatus

      module SpendLimits
        module SpendLimitIncreaseRequestStatus
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          APPROVED =
            T.let(
              :approved,
              Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus::TaggedSymbol
            )
          DENIED =
            T.let(
              :denied,
              Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::SpendLimits::SpendLimitIncreaseRequestStatus::TaggedSymbol
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
