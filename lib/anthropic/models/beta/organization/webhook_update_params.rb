# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Webhooks#update
        class WebhookUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute webhook_endpoint_id
          #   ID of the webhook endpoint.
          #
          #   @return [String]
          required :webhook_endpoint_id, String

          # @!attribute description
          #   Notes about the endpoint.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute enabled_events
          #   The event types to deliver to the endpoint. Replaces the whole set; an empty
          #   list leaves it unchanged.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::WebhookUpdateParams::EnabledEvent>, nil]
          optional :enabled_events,
                   -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent] }

          # @!attribute name
          #   A short label for the endpoint.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute state
          #   `disabled` stops deliveries. `enabled` resumes them and clears
          #   `disabled_reason`. Events that happen while the endpoint is disabled are never
          #   delivered.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::WebhookUpdateParams::State, nil]
          optional :state, enum: -> { Anthropic::Beta::Organization::WebhookUpdateParams::State }

          # @!attribute url
          #   The HTTPS URL that deliveries are sent to.
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute betas
          #   This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(webhook_endpoint_id:, description: nil, enabled_events: nil, name: nil, state: nil, url: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WebhookUpdateParams} for more details.
          #
          #   @param webhook_endpoint_id [String] ID of the webhook endpoint.
          #
          #   @param description [String] Notes about the endpoint.
          #
          #   @param enabled_events [Array<Symbol, Anthropic::Models::Beta::Organization::WebhookUpdateParams::EnabledEvent>] The event types to deliver to the endpoint. Replaces the whole set; an empty lis
          #
          #   @param name [String] A short label for the endpoint.
          #
          #   @param state [Symbol, Anthropic::Models::Beta::Organization::WebhookUpdateParams::State] `disabled` stops deliveries. `enabled` resumes them and clears `disabled_reason`
          #
          #   @param url [String] The HTTPS URL that deliveries are sent to.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `webhooks-2026-10-07` in this heade
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          module EnabledEvent
            extend Anthropic::Internal::Type::Enum

            USER_PROFILE_ENFORCEMENT_ACTION_OPENED = :"user_profile.enforcement_action_opened"
            USER_PROFILE_ENFORCEMENT_ACTION_RESOLVED = :"user_profile.enforcement_action_resolved"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # `disabled` stops deliveries. `enabled` resumes them and clears
          # `disabled_reason`. Events that happen while the endpoint is disabled are never
          # delivered.
          module State
            extend Anthropic::Internal::Type::Enum

            DISABLED = :disabled
            ENABLED = :enabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
