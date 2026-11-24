# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # A review case status to filter by: `open` or `closed`.
          module BetaComplianceReviewCaseStatusFilter
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Cases that Anthropic is waiting for a response to.
            OPEN =
              T.let(
                :open,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter::TaggedSymbol
              )

            # Cases that Anthropic has stopped waiting on.
            CLOSED =
              T.let(
                :closed,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter::TaggedSymbol
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
