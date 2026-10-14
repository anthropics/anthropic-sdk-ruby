# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The state to set on a telemetry destination, by `type` alone.
        #
        # A caller can't set the `reason` of a disabled state. Only the API sets it.
        module BetaTelemetryDestinationStateParams
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Start deliveries to the telemetry destination again.
          #
          # This doesn't reset `delivery_health`.
          variant :enabled, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams }

          # Stop deliveries to the telemetry destination.
          #
          # Spans produced while it is disabled aren't delivered later. A destination that is already disabled keeps its `reason`.
          variant :disabled, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams }

          module Type
            extend Anthropic::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabledParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabledParams)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateParams::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabledParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabledParams]
          def self.new(type:, **args)
            case type.to_sym
            when :enabled
              Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams.new(**args)
            when :disabled
              Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
