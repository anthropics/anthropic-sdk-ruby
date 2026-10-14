# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The outcome of a test: `success`, or `failure` with the reason.
        module BetaTelemetryDestinationTestResult
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The destination answered the test span with a 2xx status.
          variant :success, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationTestSuccess }

          # The test span was not delivered.
          variant :failure, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationTestFailure }

          module Type
            extend Anthropic::Internal::Type::Enum

            SUCCESS = :success
            FAILURE = :failure

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestSuccess, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestFailure)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestResult} for
          # more details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestResult::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :error A message that describes why the test span was not delivered, including the HTTP
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestSuccess, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestFailure]
          def self.new(type:, **args)
            case type.to_sym
            when :success
              Anthropic::Beta::Organization::BetaTelemetryDestinationTestSuccess.new(**args)
            when :failure
              Anthropic::Beta::Organization::BetaTelemetryDestinationTestFailure.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
