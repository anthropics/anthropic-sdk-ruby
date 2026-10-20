# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Webhooks#create
        class BetaNewOrganizationWebhookEndpoint < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the webhook endpoint.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   When the endpoint was created, in RFC 3339 format.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute description
          #   Notes about the endpoint. An empty string when none were given.
          #
          #   @return [String]
          required :description, String

          # @!attribute disabled_reason
          #   Why Anthropic disabled the endpoint automatically. An empty string when the
          #   endpoint is enabled, or when you disabled it.
          #
          #   @return [String]
          required :disabled_reason, String

          # @!attribute enabled_events
          #   The event types delivered to the endpoint.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaNewOrganizationWebhookEndpoint::EnabledEvent>]
          required :enabled_events,
                   -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaNewOrganizationWebhookEndpoint::EnabledEvent] }

          # @!attribute name
          #   A short label for the endpoint. An empty string when none was given.
          #
          #   @return [String]
          required :name, String

          # @!attribute signing_secret
          #   The secret Anthropic signs deliveries to the endpoint with (prefix `whsec_`). No
          #   other response returns it, so store it now. To replace it, regenerate the
          #   signing secret.
          #
          #   @return [String]
          required :signing_secret, String

          # @!attribute state
          #   Whether deliveries are sent to the endpoint.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaOrganizationWebhookEndpointState]
          required :state, enum: -> { Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState }

          # @!attribute updated_at
          #   When the endpoint was last changed, in RFC 3339 format.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute url
          #   The HTTPS URL that deliveries are sent to.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(id:, created_at:, description:, disabled_reason:, enabled_events:, name:, signing_secret:, state:, updated_at:, url:)
          #   A new organization webhook endpoint, with its signing secret.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaNewOrganizationWebhookEndpoint} for
          #   more details.
          #
          #   @param id [String] ID of the webhook endpoint.
          #
          #   @param created_at [Time] When the endpoint was created, in RFC 3339 format.
          #
          #   @param description [String] Notes about the endpoint. An empty string when none were given.
          #
          #   @param disabled_reason [String] Why Anthropic disabled the endpoint automatically. An empty string when the endp
          #
          #   @param enabled_events [Array<Symbol, Anthropic::Models::Beta::Organization::BetaNewOrganizationWebhookEndpoint::EnabledEvent>] The event types delivered to the endpoint.
          #
          #   @param name [String] A short label for the endpoint. An empty string when none was given.
          #
          #   @param signing_secret [String] The secret Anthropic signs deliveries to the endpoint with (prefix `whsec_`). No
          #
          #   @param state [Symbol, Anthropic::Models::Beta::Organization::BetaOrganizationWebhookEndpointState] Whether deliveries are sent to the endpoint.
          #
          #   @param updated_at [Time] When the endpoint was last changed, in RFC 3339 format.
          #
          #   @param url [String] The HTTPS URL that deliveries are sent to.

          module EnabledEvent
            extend Anthropic::Internal::Type::Enum

            USER_PROFILE_ENFORCEMENT_ACTION_OPENED = :"user_profile.enforcement_action_opened"
            USER_PROFILE_ENFORCEMENT_ACTION_RESOLVED = :"user_profile.enforcement_action_resolved"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
