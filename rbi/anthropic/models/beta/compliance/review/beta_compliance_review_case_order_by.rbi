# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # The field that a list of review cases is sorted by: `created_at` or
          # `updated_at`.
          module BetaComplianceReviewCaseOrderBy
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Sort by when Anthropic sent the case.
            CREATED_AT =
              T.let(
                :created_at,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy::TaggedSymbol
              )

            # Sort by when the case last changed.
            UPDATED_AT =
              T.let(
                :updated_at,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy::TaggedSymbol
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
