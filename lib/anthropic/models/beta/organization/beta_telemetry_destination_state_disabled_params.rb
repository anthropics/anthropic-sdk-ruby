# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationStateDisabledParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :disabled]
          required :type, const: :disabled

          # @!method initialize(type: :disabled)
          #   Stop deliveries to the telemetry destination.
          #
          #   Spans produced while it is disabled aren't delivered later. A destination that
          #   is already disabled keeps its `reason`.
          #
          #   @param type [Symbol, :disabled]
        end
      end
    end
  end
end
