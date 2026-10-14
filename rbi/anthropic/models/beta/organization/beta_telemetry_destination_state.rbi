# typed: strong

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

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabled,
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabled
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationState::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENABLED =
              T.let(
                :enabled,
                Anthropic::Beta::Organization::BetaTelemetryDestinationState::Type::TaggedSymbol
              )
            DISABLED =
              T.let(
                :disabled,
                Anthropic::Beta::Organization::BetaTelemetryDestinationState::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaTelemetryDestinationState::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaTelemetryDestinationState::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaTelemetryDestinationState::Type::OrSymbol,
              reason:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect::OrHash
                )
            ).returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationState::Variants
            )
          end
          def self.new(
            type:,
            # Whether a caller or the API disabled the destination and, when the API did, why.
            # Read-only.
            reason: nil
          )
          end
        end
      end
    end
  end
end
