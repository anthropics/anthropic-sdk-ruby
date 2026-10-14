# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The outcome of a test: `success`, or `failure` with the reason.
        module BetaTelemetryDestinationTestResult
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestSuccess,
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestFailure
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCESS =
              T.let(
                :success,
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Type::TaggedSymbol
              )
            FAILURE =
              T.let(
                :failure,
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Variants
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
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Type::OrSymbol,
              error: String
            ).returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationTestResult::Variants
            )
          end
          def self.new(
            type:,
            # A message that describes why the test span was not delivered, including the HTTP
            # status code when the destination returned one. Examples:
            # `HTTP error (status 403)`, `timeout`, `TLS failure`. It has the same form as the
            # destination's `delivery_health.last_error` and never contains the destination's
            # response body, any header value, a network address, or TLS details.
            error: nil
          )
          end
        end
      end
    end
  end
end
