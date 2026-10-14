# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTestResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # How the test went: `success` when the destination answered with a 2xx status,
          # else `failure` with the reason.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Variants
            )
          end
          attr_accessor :result

          sig { returns(Symbol) }
          attr_accessor :type

          # The result of one test span sent to a destination.
          sig do
            params(
              result:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTestSuccess::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTestFailure::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # How the test went: `success` when the destination answered with a 2xx status,
            # else `failure` with the reason.
            result:,
            type: :telemetry_destination_test
          )
          end

          sig do
            override.returns(
              {
                result:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Variants,
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
