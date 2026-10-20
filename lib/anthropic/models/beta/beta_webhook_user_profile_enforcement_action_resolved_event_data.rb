# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookUserProfileEnforcementActionResolvedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the user profile the enforcement action is on.
        #
        #   @return [String]
        required :id, String

        # @!attribute enforcement_action_id
        #   ID (`enac_...`) of the enforcement action that was opened or resolved.
        #
        #   @return [String]
        required :enforcement_action_id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"user_profile.enforcement_action_resolved"]
        required :type, const: :"user_profile.enforcement_action_resolved"

        # @!method initialize(id:, enforcement_action_id:, organization_id:, type: :"user_profile.enforcement_action_resolved")
        #   @param id [String] ID of the user profile the enforcement action is on.
        #
        #   @param enforcement_action_id [String] ID (`enac_...`) of the enforcement action that was opened or resolved.
        #
        #   @param organization_id [String]
        #
        #   @param type [Symbol, :"user_profile.enforcement_action_resolved"]
      end
    end

    BetaWebhookUserProfileEnforcementActionResolvedEventData =
      Beta::BetaWebhookUserProfileEnforcementActionResolvedEventData
  end
end
