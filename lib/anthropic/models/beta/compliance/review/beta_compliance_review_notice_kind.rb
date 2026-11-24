# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewNoticeKind < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   `response_requested` asks you to respond to the cases in `case_ids`. For
            #   `warning` and `question`, `message` explains how to answer if an answer is
            #   needed. New values can appear, so accept a value that you don't know.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type]
            required :type, enum: -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type }

            # @!method initialize(type:)
            #   The kind of a review notice.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNoticeKind}
            #   for more details.
            #
            #   @param type [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::Type] `response_requested` asks you to respond to the cases in `case_ids`. For

            # `response_requested` asks you to respond to the cases in `case_ids`. For
            # `warning` and `question`, `message` explains how to answer if an answer is
            # needed. New values can appear, so accept a value that you don't know.
            #
            # @see Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNoticeKind#type
            module Type
              extend Anthropic::Internal::Type::Enum

              RESPONSE_REQUESTED = :response_requested
              WARNING = :warning
              QUESTION = :question

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
