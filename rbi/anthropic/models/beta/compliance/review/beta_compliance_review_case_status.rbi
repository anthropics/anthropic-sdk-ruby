# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # The status of a review case.
          module BetaComplianceReviewCaseStatus
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOpen,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseClosed
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              OPEN =
                T.let(
                  :open,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Type::TaggedSymbol
                )
              CLOSED =
                T.let(
                  :closed,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Type::OrSymbol,
                reason:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::OrHash
              ).returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Variants
              )
            end
            def self.new(
              type:,
              # Why the case closed. It doesn't change afterwards.
              reason: nil
            )
            end
          end
        end
      end
    end
  end
end
