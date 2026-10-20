# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Webhooks#create
        class WebhookCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute enabled_events
          #   The event types to deliver to the endpoint. Must list at least one.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::WebhookCreateParams::EnabledEvent>]
          required :enabled_events,
                   -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent] }

          # @!attribute url
          #   The HTTPS URL that deliveries are sent to.
          #
          #   @return [String]
          required :url, String

          # @!attribute description
          #   Notes about the endpoint.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute name
          #   A short label for the endpoint.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute betas
          #   This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(enabled_events:, url:, description: nil, name: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WebhookCreateParams} for more details.
          #
          #   @param enabled_events [Array<Symbol, Anthropic::Models::Beta::Organization::WebhookCreateParams::EnabledEvent>] The event types to deliver to the endpoint. Must list at least one.
          #
          #   @param url [String] The HTTPS URL that deliveries are sent to.
          #
          #   @param description [String] Notes about the endpoint.
          #
          #   @param name [String] A short label for the endpoint.
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
        end
      end
    end
  end
end
