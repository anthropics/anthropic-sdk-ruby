# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationStateEnabledParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :enabled]
          required :type, const: :enabled

          # @!method initialize(type: :enabled)
          #   Start deliveries to the telemetry destination again.
          #
          #   This doesn't reset `delivery_health`.
          #
          #   @param type [Symbol, :enabled]
        end
      end
    end
  end
end
