# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationStateDisabled < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabled,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether a caller or the API disabled the destination and, when the API did, why.
          # Read-only.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Variants
            )
          end
          attr_accessor :reason

          sig { returns(Symbol) }
          attr_accessor :type

          # The API doesn't deliver anything to the telemetry destination.
          #
          # Spans produced while it is disabled aren't delivered later.
          sig do
            params(
              reason:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether a caller or the API disabled the destination and, when the API did, why.
            # Read-only.
            reason:,
            type: :disabled
          )
          end

          sig do
            override.returns(
              {
                reason:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Variants,
                type: Symbol
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
