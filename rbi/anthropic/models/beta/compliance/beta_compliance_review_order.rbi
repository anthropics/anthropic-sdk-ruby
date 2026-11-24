# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        # A sort direction: `asc` or `desc`.
        module BetaComplianceReviewOrder
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Compliance::BetaComplianceReviewOrder
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Oldest first.
          ASC =
            T.let(
              :asc,
              Anthropic::Beta::Compliance::BetaComplianceReviewOrder::TaggedSymbol
            )

          # Newest first.
          DESC =
            T.let(
              :desc,
              Anthropic::Beta::Compliance::BetaComplianceReviewOrder::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Compliance::BetaComplianceReviewOrder::TaggedSymbol
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
