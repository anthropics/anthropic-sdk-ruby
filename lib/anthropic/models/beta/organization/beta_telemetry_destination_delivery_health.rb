# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDeliveryHealth < Anthropic::Internal::Type::BaseModel
          # @!attribute last_error
          #   A message that describes the most recent failed delivery to the destination, or
          #   `null` if no delivery has failed yet.
          #
          #   Examples are `temporary DNS failure`, `TLS failure`, `timeout`,
          #   `connection failure`, `invalid address`, `HTTP error (status 503)`, and
          #   `redirect (status 301)`. The message is `invalid address` both for a hostname
          #   that doesn't exist and for an address that isn't publicly routable. It never
          #   contains the endpoint's response body, a header value, a network address, or TLS
          #   details.
          #
          #   `last_error` and `last_error_at` always change together. A later successful
          #   delivery doesn't clear them. If `last_success_at` is later than `last_error_at`,
          #   a delivery has succeeded since this failure.
          #
          #   See the
          #   [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-errors)
          #   to learn the likely cause of each error.
          #
          #   @return [String, nil]
          required :last_error, String, nil?: true

          # @!attribute last_error_at
          #   Time of the failure that `last_error` describes. Changes together with
          #   `last_error`. Null until a delivery first fails.
          #
          #   @return [Time, nil]
          required :last_error_at, Time, nil?: true

          # @!attribute last_success_at
          #   Time of the most recent successful delivery to the destination, or `null` if no
          #   delivery has succeeded yet.
          #
          #   @return [Time, nil]
          required :last_success_at, Time, nil?: true

          # @!method initialize(last_error:, last_error_at:, last_success_at:)
          #   The most recent delivery results that the API records for a telemetry
          #   destination.
          #
          #   Changes to the destination's configuration or state don't reset these fields.
          #   Changes to these fields don't change `updated_at`. The values can lag behind the
          #   latest deliveries.
          #
          #   See the
          #   [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          #   to learn how the API delivers spans and when it disables a destination.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDeliveryHealth}
          #   for more details.
          #
          #   @param last_error [String, nil] A message that describes the most recent failed delivery to the destination, or
          #
          #   @param last_error_at [Time, nil] Time of the failure that `last_error` describes. Changes together with `last_err
          #
          #   @param last_success_at [Time, nil] Time of the most recent successful delivery to the destination, or `null` if no
        end
      end
    end
  end
end
