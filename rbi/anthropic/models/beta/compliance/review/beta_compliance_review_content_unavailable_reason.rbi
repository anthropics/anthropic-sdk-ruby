# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # Why a message's content isn't returned.
          module BetaComplianceReviewContentUnavailableReason
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NOT_CAPTURED =
                T.let(
                  :not_captured,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Type::TaggedSymbol
                )
              STORED_COPY_UNAVAILABLE =
                T.let(
                  :stored_copy_unavailable,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Variants
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
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Type::OrSymbol
              ).returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Variants
              )
            end
            def self.new(type:)
            end
          end
        end
      end
    end
  end
end
