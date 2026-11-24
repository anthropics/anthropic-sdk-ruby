# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewUserActor < Anthropic::Internal::Type::BaseModel
            # @!attribute email_address
            #   The user's email address. Set only for a current member of an organization that
            #   the API key can read.
            #
            #   @return [String, nil]
            required :email_address, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, :user_actor]
            required :type, const: :user_actor

            # @!attribute user_id
            #   The ID of the user (`user_...`).
            #
            #   @return [String]
            required :user_id, String

            # @!method initialize(email_address:, user_id:, type: :user_actor)
            #   A signed-in user.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewUserActor} for
            #   more details.
            #
            #   @param email_address [String, nil] The user's email address. Set only for a current member of an organization that
            #
            #   @param user_id [String] The ID of the user (`user_...`).
            #
            #   @param type [Symbol, :user_actor]
          end
        end
      end
    end
  end
end
