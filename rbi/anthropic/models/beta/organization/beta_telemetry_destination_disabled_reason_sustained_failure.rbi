# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDisabledReasonSustainedFailure < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The API disabled the destination because deliveries to it failed, with no
          # successful delivery in between, for longer than a threshold that Anthropic
          # configures and that is not part of this contract. The reason is
          # `invalid_address` instead when the most recent failed delivery failed with an
          # invalid address.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :sustained_failure)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
