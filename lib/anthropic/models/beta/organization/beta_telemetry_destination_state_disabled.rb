# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationStateDisabled < Anthropic::Internal::Type::BaseModel
          # @!attribute reason
          #   Whether a caller or the API disabled the destination and, when the API did, why.
          #   Read-only.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect]
          required :reason, union: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason }

          # @!attribute type
          #
          #   @return [Symbol, :disabled]
          required :type, const: :disabled

          # @!method initialize(reason:, type: :disabled)
          #   The API doesn't deliver anything to the telemetry destination.
          #
          #   Spans produced while it is disabled aren't delivered later.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabled}
          #   for more details.
          #
          #   @param reason [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect] Whether a caller or the API disabled the destination and, when the API did, why.
          #
          #   @param type [Symbol, :disabled]
        end
      end
    end
  end
end
