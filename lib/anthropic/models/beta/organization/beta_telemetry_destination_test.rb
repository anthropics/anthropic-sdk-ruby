# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations#test_
        class BetaTelemetryDestinationTest < Anthropic::Internal::Type::BaseModel
          # @!attribute result
          #   How the test went: `success` when the destination answered with a 2xx status,
          #   else `failure` with the reason.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestSuccess, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestFailure]
          required :result, union: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult }

          # @!attribute type
          #
          #   @return [Symbol, :telemetry_destination_test]
          required :type, const: :telemetry_destination_test

          # @!method initialize(result:, type: :telemetry_destination_test)
          #   The result of one test span sent to a destination.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTest} for more
          #   details.
          #
          #   @param result [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestSuccess, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestFailure] How the test went: `success` when the destination answered with a 2xx status, el
          #
          #   @param type [Symbol, :telemetry_destination_test]
        end
      end
    end
  end
end
