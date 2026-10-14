# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDeliveryHealth < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth,
                Anthropic::Internal::AnyHash
              )
            end

          # A message that describes the most recent failed delivery to the destination, or
          # `null` if no delivery has failed yet.
          #
          # Examples are `temporary DNS failure`, `TLS failure`, `timeout`,
          # `connection failure`, `invalid address`, `HTTP error (status 503)`, and
          # `redirect (status 301)`. The message is `invalid address` both for a hostname
          # that doesn't exist and for an address that isn't publicly routable. It never
          # contains the endpoint's response body, a header value, a network address, or TLS
          # details.
          #
          # `last_error` and `last_error_at` always change together. A later successful
          # delivery doesn't clear them. If `last_success_at` is later than `last_error_at`,
          # a delivery has succeeded since this failure.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-errors)
          # to learn the likely cause of each error.
          sig { returns(T.nilable(String)) }
          attr_accessor :last_error

          # Time of the failure that `last_error` describes. Changes together with
          # `last_error`. Null until a delivery first fails.
          sig { returns(T.nilable(Time)) }
          attr_accessor :last_error_at

          # Time of the most recent successful delivery to the destination, or `null` if no
          # delivery has succeeded yet.
          sig { returns(T.nilable(Time)) }
          attr_accessor :last_success_at

          # The most recent delivery results that the API records for a telemetry
          # destination.
          #
          # Changes to the destination's configuration or state don't reset these fields.
          # Changes to these fields don't change `updated_at`. The values can lag behind the
          # latest deliveries.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          # to learn how the API delivers spans and when it disables a destination.
          sig do
            params(
              last_error: T.nilable(String),
              last_error_at: T.nilable(Time),
              last_success_at: T.nilable(Time)
            ).returns(T.attached_class)
          end
          def self.new(
            # A message that describes the most recent failed delivery to the destination, or
            # `null` if no delivery has failed yet.
            #
            # Examples are `temporary DNS failure`, `TLS failure`, `timeout`,
            # `connection failure`, `invalid address`, `HTTP error (status 503)`, and
            # `redirect (status 301)`. The message is `invalid address` both for a hostname
            # that doesn't exist and for an address that isn't publicly routable. It never
            # contains the endpoint's response body, a header value, a network address, or TLS
            # details.
            #
            # `last_error` and `last_error_at` always change together. A later successful
            # delivery doesn't clear them. If `last_success_at` is later than `last_error_at`,
            # a delivery has succeeded since this failure.
            #
            # See the
            # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-errors)
            # to learn the likely cause of each error.
            last_error:,
            # Time of the failure that `last_error` describes. Changes together with
            # `last_error`. Null until a delivery first fails.
            last_error_at:,
            # Time of the most recent successful delivery to the destination, or `null` if no
            # delivery has succeeded yet.
            last_success_at:
          )
          end

          sig do
            override.returns(
              {
                last_error: T.nilable(String),
                last_error_at: T.nilable(Time),
                last_success_at: T.nilable(Time)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
