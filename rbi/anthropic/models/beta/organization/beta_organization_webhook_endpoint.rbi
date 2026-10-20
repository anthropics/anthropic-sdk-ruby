# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationWebhookEndpoint < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the webhook endpoint.
          sig { returns(String) }
          attr_accessor :id

          # When the endpoint was created, in RFC 3339 format.
          sig { returns(Time) }
          attr_accessor :created_at

          # Notes about the endpoint. An empty string when none were given.
          sig { returns(String) }
          attr_accessor :description

          # Why Anthropic disabled the endpoint automatically. An empty string when the
          # endpoint is enabled, or when you disabled it.
          sig { returns(String) }
          attr_accessor :disabled_reason

          # The event types delivered to the endpoint.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent::TaggedSymbol
              ]
            )
          end
          attr_accessor :enabled_events

          # A short label for the endpoint. An empty string when none was given.
          sig { returns(String) }
          attr_accessor :name

          # Whether deliveries are sent to the endpoint.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState::TaggedSymbol
            )
          end
          attr_accessor :state

          # When the endpoint was last changed, in RFC 3339 format.
          sig { returns(Time) }
          attr_accessor :updated_at

          # The HTTPS URL that deliveries are sent to.
          sig { returns(String) }
          attr_accessor :url

          # A webhook endpoint that belongs to the organization rather than to one of its
          # workspaces.
          sig do
            params(
              id: String,
              created_at: Time,
              description: String,
              disabled_reason: String,
              enabled_events:
                T::Array[
                  Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent::OrSymbol
                ],
              name: String,
              state:
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState::OrSymbol,
              updated_at: Time,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the webhook endpoint.
            id:,
            # When the endpoint was created, in RFC 3339 format.
            created_at:,
            # Notes about the endpoint. An empty string when none were given.
            description:,
            # Why Anthropic disabled the endpoint automatically. An empty string when the
            # endpoint is enabled, or when you disabled it.
            disabled_reason:,
            # The event types delivered to the endpoint.
            enabled_events:,
            # A short label for the endpoint. An empty string when none was given.
            name:,
            # Whether deliveries are sent to the endpoint.
            state:,
            # When the endpoint was last changed, in RFC 3339 format.
            updated_at:,
            # The HTTPS URL that deliveries are sent to.
            url:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                description: String,
                disabled_reason: String,
                enabled_events:
                  T::Array[
                    Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent::TaggedSymbol
                  ],
                name: String,
                state:
                  Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState::TaggedSymbol,
                updated_at: Time,
                url: String
              }
            )
          end
          def to_hash
          end

          module EnabledEvent
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_PROFILE_ENFORCEMENT_ACTION_OPENED =
              T.let(
                :"user_profile.enforcement_action_opened",
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent::TaggedSymbol
              )
            USER_PROFILE_ENFORCEMENT_ACTION_RESOLVED =
              T.let(
                :"user_profile.enforcement_action_resolved",
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
