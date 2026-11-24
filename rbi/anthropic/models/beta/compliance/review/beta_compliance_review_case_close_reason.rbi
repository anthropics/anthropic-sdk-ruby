# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCaseCloseReason < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason,
                  Anthropic::Internal::AnyHash
                )
              end

            # `responded` means that Anthropic recorded a response. `window_ended` means that
            # the time to respond ended with no response. `ended_by_anthropic` means that
            # Anthropic ended the case before that time was over. New values can appear, so
            # accept a value that you don't know.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            # Why a review case closed.
            sig do
              params(
                type:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # `responded` means that Anthropic recorded a response. `window_ended` means that
              # the time to respond ended with no response. `ended_by_anthropic` means that
              # Anthropic ended the case before that time was over. New values can appear, so
              # accept a value that you don't know.
              type:
            )
            end

            sig do
              override.returns(
                {
                  type:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # `responded` means that Anthropic recorded a response. `window_ended` means that
            # the time to respond ended with no response. `ended_by_anthropic` means that
            # Anthropic ended the case before that time was over. New values can appear, so
            # accept a value that you don't know.
            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              RESPONDED =
                T.let(
                  :responded,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type::TaggedSymbol
                )
              WINDOW_ENDED =
                T.let(
                  :window_ended,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type::TaggedSymbol
                )
              ENDED_BY_ANTHROPIC =
                T.let(
                  :ended_by_anthropic,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type::TaggedSymbol
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
end
