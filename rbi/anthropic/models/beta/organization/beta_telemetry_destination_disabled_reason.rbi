# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Why the destination is disabled: `caller` when a caller disabled it, or the
        # reason the API disabled it automatically (`sustained_failure`,
        # `invalid_address`, or `redirect`). Every automatic disable is reversible with an
        # update that sets `state` to `enabled`. An update that sets `disabled` on a
        # destination that is already disabled keeps its reason.
        module BetaTelemetryDestinationDisabledReason
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller,
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure,
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress,
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CALLER =
              T.let(
                :caller,
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type::TaggedSymbol
              )
            SUSTAINED_FAILURE =
              T.let(
                :sustained_failure,
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type::TaggedSymbol
              )
            INVALID_ADDRESS =
              T.let(
                :invalid_address,
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type::TaggedSymbol
              )
            REDIRECT =
              T.let(
                :redirect,
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Variants
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
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type::OrSymbol
            ).returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReason::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
