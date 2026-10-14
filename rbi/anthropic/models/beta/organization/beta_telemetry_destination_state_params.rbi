# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The state to set on a telemetry destination, by `type` alone.
        #
        # A caller can't set the `reason` of a disabled state. Only the API sets it.
        module BetaTelemetryDestinationStateParams
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams,
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENABLED =
              T.let(
                :enabled,
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams::Type::TaggedSymbol
              )
            DISABLED =
              T.let(
                :disabled,
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams::Variants
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
                Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams::Type::OrSymbol
            ).returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
