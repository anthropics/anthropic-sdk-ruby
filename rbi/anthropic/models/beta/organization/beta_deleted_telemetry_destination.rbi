# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDeletedTelemetryDestination < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaDeletedTelemetryDestination,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the deleted destination (`tdst_...`).
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :type

          # Confirmation that a destination was deleted.
          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # ID of the deleted destination (`tdst_...`).
            id:,
            type: :telemetry_destination_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
