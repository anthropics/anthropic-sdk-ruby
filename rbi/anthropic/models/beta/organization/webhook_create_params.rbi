# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class WebhookCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::WebhookCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The event types to deliver to the endpoint. Must list at least one.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent::OrSymbol
              ]
            )
          end
          attr_accessor :enabled_events

          # The HTTPS URL that deliveries are sent to.
          sig { returns(String) }
          attr_accessor :url

          # Notes about the endpoint.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # A short label for the endpoint.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

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
              enabled_events:
                T::Array[
                  Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent::OrSymbol
                ],
              url: String,
              description: String,
              name: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The event types to deliver to the endpoint. Must list at least one.
            enabled_events:,
            # The HTTPS URL that deliveries are sent to.
            url:,
            # Notes about the endpoint.
            description: nil,
            # A short label for the endpoint.
            name: nil,
            # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                enabled_events:
                  T::Array[
                    Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent::OrSymbol
                  ],
                url: String,
                description: String,
                name: String,
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
                  Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_PROFILE_ENFORCEMENT_ACTION_OPENED =
              T.let(
                :"user_profile.enforcement_action_opened",
                Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent::TaggedSymbol
              )
            USER_PROFILE_ENFORCEMENT_ACTION_RESOLVED =
              T.let(
                :"user_profile.enforcement_action_resolved",
                Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent::TaggedSymbol
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
