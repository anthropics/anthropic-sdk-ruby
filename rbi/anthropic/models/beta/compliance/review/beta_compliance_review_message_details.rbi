# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewMessageDetails < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewMessageDetails,
                  Anthropic::Internal::AnyHash
                )
              end

            # The stored request and response. Null when `content_unavailable_reason` is set.
            # New types can appear, so accept a type that you don't know.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent
                )
              )
            end
            attr_reader :content

            sig do
              params(
                content:
                  T.nilable(
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent::OrHash
                  )
              ).void
            end
            attr_writer :content

            # Why `content` is null. Null when `content` is set. New types can appear, so
            # accept a type that you don't know.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Variants
                )
              )
            end
            attr_accessor :content_unavailable_reason

            # The model that the call named. Null when none was recorded.
            sig { returns(T.nilable(String)) }
            attr_accessor :model

            sig { returns(Symbol) }
            attr_accessor :type

            # A message sent to Claude.
            sig do
              params(
                content:
                  T.nilable(
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent::OrHash
                  ),
                content_unavailable_reason:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured::OrHash,
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable::OrHash
                    )
                  ),
                model: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The stored request and response. Null when `content_unavailable_reason` is set.
              # New types can appear, so accept a type that you don't know.
              content:,
              # Why `content` is null. Null when `content` is set. New types can appear, so
              # accept a type that you don't know.
              content_unavailable_reason:,
              # The model that the call named. Null when none was recorded.
              model:,
              type: :message
            )
            end

            sig do
              override.returns(
                {
                  content:
                    T.nilable(
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent
                    ),
                  content_unavailable_reason:
                    T.nilable(
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Variants
                    ),
                  model: T.nilable(String),
                  type: Symbol
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
