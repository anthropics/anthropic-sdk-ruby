# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewTranscript < Anthropic::Internal::Type::BaseModel
            # @!attribute item_id
            #   The ID of the flagged message.
            #
            #   @return [String]
            required :item_id, String

            # @!attribute user_profile_id
            #   The ID of the user profile that the message belongs to. Null when the message
            #   belongs to none, or when the profile can no longer be looked up.
            #
            #   @return [String, nil]
            required :user_profile_id, String, nil?: true

            # @!method initialize(item_id:, user_profile_id:)
            #   One flagged message of a review case.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewTranscript}
            #   for more details.
            #
            #   @param item_id [String] The ID of the flagged message.
            #
            #   @param user_profile_id [String, nil] The ID of the user profile that the message belongs to. Null when the message be
          end
        end
      end
    end
  end
end
