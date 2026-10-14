# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationStateDisabledParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Stop deliveries to the telemetry destination.
          #
          # Spans produced while it is disabled aren't delivered later. A destination that
          # is already disabled keeps its `reason`.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :disabled)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
