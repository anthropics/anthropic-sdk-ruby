# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class WebhookUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::WebhookUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the webhook endpoint.
          sig { returns(String) }
          attr_accessor :webhook_endpoint_id

          # Notes about the endpoint.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # The event types to deliver to the endpoint. Replaces the whole set; an empty
          # list leaves it unchanged.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::OrSymbol
                ]
              )
            )
          end
          attr_reader :enabled_events

          sig do
            params(
              enabled_events:
                T::Array[
                  Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::OrSymbol
                ]
            ).void
          end
          attr_writer :enabled_events

          # A short label for the endpoint.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # `disabled` stops deliveries. `enabled` resumes them and clears
          # `disabled_reason`. Events that happen while the endpoint is disabled are never
          # delivered.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::WebhookUpdateParams::State::OrSymbol
              )
            )
          end
          attr_reader :state

          sig do
            params(
              state:
                Anthropic::Beta::Organization::WebhookUpdateParams::State::OrSymbol
            ).void
          end
          attr_writer :state

          # The HTTPS URL that deliveries are sent to.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
          # header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              webhook_endpoint_id: String,
              description: String,
              enabled_events:
                T::Array[
                  Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::OrSymbol
                ],
              name: String,
              state:
                Anthropic::Beta::Organization::WebhookUpdateParams::State::OrSymbol,
              url: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the webhook endpoint.
            webhook_endpoint_id:,
            # Notes about the endpoint.
            description: nil,
            # The event types to deliver to the endpoint. Replaces the whole set; an empty
            # list leaves it unchanged.
            enabled_events: nil,
            # A short label for the endpoint.
            name: nil,
            # `disabled` stops deliveries. `enabled` resumes them and clears
            # `disabled_reason`. Events that happen while the endpoint is disabled are never
            # delivered.
            state: nil,
            # The HTTPS URL that deliveries are sent to.
            url: nil,
            # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                webhook_endpoint_id: String,
                description: String,
                enabled_events:
                  T::Array[
                    Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::OrSymbol
                  ],
                name: String,
                state:
                  Anthropic::Beta::Organization::WebhookUpdateParams::State::OrSymbol,
                url: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
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
                  Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_PROFILE_ENFORCEMENT_ACTION_OPENED =
              T.let(
                :"user_profile.enforcement_action_opened",
                Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::TaggedSymbol
              )
            USER_PROFILE_ENFORCEMENT_ACTION_RESOLVED =
              T.let(
                :"user_profile.enforcement_action_resolved",
                Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # `disabled` stops deliveries. `enabled` resumes them and clears
          # `disabled_reason`. Events that happen while the endpoint is disabled are never
          # delivered.
          module State
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::WebhookUpdateParams::State
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DISABLED =
              T.let(
                :disabled,
                Anthropic::Beta::Organization::WebhookUpdateParams::State::TaggedSymbol
              )
            ENABLED =
              T.let(
                :enabled,
                Anthropic::Beta::Organization::WebhookUpdateParams::State::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::WebhookUpdateParams::State::TaggedSymbol
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
