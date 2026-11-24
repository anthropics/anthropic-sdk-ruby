# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewVerdictParam < Anthropic::Internal::Type::BaseModel
            # @!attribute determination
            #   Your conclusion on this message.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewDetermination]
            required :determination,
                     enum: -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination }

            # @!attribute item_id
            #   The `item_id` of one of the case's `transcripts`.
            #
            #   @return [String]
            required :item_id, String

            # @!attribute policy_category
            #   The policy category that this message violated, from the values that the
            #   request's `policy_categories` accepts. Optional with `violation`. Leave it out
            #   with `no_violation`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory, nil]
            optional :policy_category,
                     enum: -> {
                       Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory
                     },
                     nil?: true

            # @!method initialize(determination:, item_id:, policy_category: nil)
            #   Your conclusion on one message of a review case.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewVerdictParam}
            #   for more details.
            #
            #   @param determination [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewDetermination] Your conclusion on this message.
            #
            #   @param item_id [String] The `item_id` of one of the case's `transcripts`.
            #
            #   @param policy_category [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory, nil] The policy category that this message violated, from the values that the request
          end
        end
      end
    end
  end
end
