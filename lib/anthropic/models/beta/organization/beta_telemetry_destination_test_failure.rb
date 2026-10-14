# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTestFailure < Anthropic::Internal::Type::BaseModel
          # @!attribute error
          #   A message that describes why the test span was not delivered, including the HTTP
          #   status code when the destination returned one. Examples:
          #   `HTTP error (status 403)`, `timeout`, `TLS failure`. It has the same form as the
          #   destination's `delivery_health.last_error` and never contains the destination's
          #   response body, any header value, a network address, or TLS details.
          #
          #   @return [String]
          required :error, String

          # @!attribute type
          #
          #   @return [Symbol, :failure]
          required :type, const: :failure

          # @!method initialize(error:, type: :failure)
          #   The test span was not delivered.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestFailure} for
          #   more details.
          #
          #   @param error [String] A message that describes why the test span was not delivered, including the HTTP
          #
          #   @param type [Symbol, :failure]
        end
      end
    end
  end
end
