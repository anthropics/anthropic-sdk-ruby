# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTestFailure < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationTestFailure,
                Anthropic::Internal::AnyHash
              )
            end

          # A message that describes why the test span was not delivered, including the HTTP
          # status code when the destination returned one. Examples:
          # `HTTP error (status 403)`, `timeout`, `TLS failure`. It has the same form as the
          # destination's `delivery_health.last_error` and never contains the destination's
          # response body, any header value, a network address, or TLS details.
          sig { returns(String) }
          attr_accessor :error

          sig { returns(Symbol) }
          attr_accessor :type

          # The test span was not delivered.
          sig { params(error: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # A message that describes why the test span was not delivered, including the HTTP
            # status code when the destination returned one. Examples:
            # `HTTP error (status 403)`, `timeout`, `TLS failure`. It has the same form as the
            # destination's `delivery_health.last_error` and never contains the destination's
            # response body, any header value, a network address, or TLS details.
            error:,
            type: :failure
          )
          end

          sig { override.returns({ error: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
