# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookUserProfileProgramStatusUpdatedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the user profile that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"user_profile.program_status_updated"]
        required :type, const: :"user_profile.program_status_updated"

        # @!method initialize(id:, organization_id:, type: :"user_profile.program_status_updated")
        #   @param id [String] ID of the user profile that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param type [Symbol, :"user_profile.program_status_updated"]
      end
    end

    BetaWebhookUserProfileProgramStatusUpdatedEventData =
      Beta::BetaWebhookUserProfileProgramStatusUpdatedEventData
  end
end
