# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Whether a telemetry destination receives deliveries.
        #
        # A caller can set either state. The API also disables an enabled destination on
        # its own in some cases. The `reason` of the disabled state says whether a caller
        # or the API disabled the destination and, when the API did, why.
        #
        # See the
        # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
        # to learn when the API disables a destination.
        module BetaTelemetryDestinationState
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The telemetry destination receives the spans of the workspaces that it covers.
          variant :enabled, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabled }

          # The API doesn't deliver anything to the telemetry destination.
          #
          # Spans produced while it is disabled aren't delivered later.
          variant :disabled, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabled }

          module Type
            extend Anthropic::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabled, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabled)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationState} for more
          # details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationState::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect] :reason Whether a caller or the API disabled the destination and, when the API did, why.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabled, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabled]
          def self.new(type:, **args)
            case type.to_sym
            when :enabled
              Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabled.new(**args)
            when :disabled
              Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabled.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
