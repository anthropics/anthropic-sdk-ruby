# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationStateEnabled < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :enabled]
          required :type, const: :enabled

          # @!method initialize(type: :enabled)
          #   The telemetry destination receives the spans of the workspaces that it covers.
          #
          #   @param type [Symbol, :enabled]
        end
      end
    end
  end
end
