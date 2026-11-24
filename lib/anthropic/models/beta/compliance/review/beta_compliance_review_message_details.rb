# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewMessageDetails < Anthropic::Internal::Type::BaseModel
            # @!attribute content
            #   The stored request and response. Null when `content_unavailable_reason` is set.
            #   New types can appear, so accept a type that you don't know.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent, nil]
            required :content,
                     -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent },
                     nil?: true

            # @!attribute content_unavailable_reason
            #   Why `content` is null. Null when `content` is set. New types can appear, so
            #   accept a type that you don't know.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable, nil]
            required :content_unavailable_reason,
                     union: -> {
                       Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason
                     },
                     nil?: true

            # @!attribute model
            #   The model that the call named. Null when none was recorded.
            #
            #   @return [String, nil]
            required :model, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, :message]
            required :type, const: :message

            # @!method initialize(content:, content_unavailable_reason:, model:, type: :message)
            #   A message sent to Claude.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewMessageDetails}
            #   for more details.
            #
            #   @param content [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent, nil] The stored request and response. Null when `content_unavailable_reason` is set.
            #
            #   @param content_unavailable_reason [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable, nil] Why `content` is null. Null when `content` is set. New types can appear, so acce
            #
            #   @param model [String, nil] The model that the call named. Null when none was recorded.
            #
            #   @param type [Symbol, :message]
          end
        end
      end
    end
  end
end
