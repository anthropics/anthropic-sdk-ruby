# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewNoticeKind < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind,
                  Anthropic::Internal::AnyHash
                )
              end

            # `response_requested` asks you to respond to the cases in `case_ids`. For
            # `warning` and `question`, `message` explains how to answer if an answer is
            # needed. New values can appear, so accept a value that you don't know.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            # The kind of a review notice.
            sig do
              params(
                type:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # `response_requested` asks you to respond to the cases in `case_ids`. For
              # `warning` and `question`, `message` explains how to answer if an answer is
              # needed. New values can appear, so accept a value that you don't know.
              type:
            )
            end

            sig do
              override.returns(
                {
                  type:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # `response_requested` asks you to respond to the cases in `case_ids`. For
            # `warning` and `question`, `message` explains how to answer if an answer is
            # needed. New values can appear, so accept a value that you don't know.
            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              RESPONSE_REQUESTED =
                T.let(
                  :response_requested,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type::TaggedSymbol
                )
              WARNING =
                T.let(
                  :warning,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type::TaggedSymbol
                )
              QUESTION =
                T.let(
                  :question,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type::TaggedSymbol
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
