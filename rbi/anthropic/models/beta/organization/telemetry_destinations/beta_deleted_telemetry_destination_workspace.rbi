# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module TelemetryDestinations
          class BetaDeletedTelemetryDestinationWorkspace < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::TelemetryDestinations::BetaDeletedTelemetryDestinationWorkspace,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the telemetry destination (`tdst_...`).
            sig { returns(String) }
            attr_accessor :telemetry_destination_id

            sig { returns(Symbol) }
            attr_accessor :type

            # ID of the workspace that was removed (`wrkspc_...`).
            sig { returns(String) }
            attr_accessor :workspace_id

            # Confirmation that a workspace was removed from a destination's list.
            sig do
              params(
                telemetry_destination_id: String,
                workspace_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the telemetry destination (`tdst_...`).
              telemetry_destination_id:,
              # ID of the workspace that was removed (`wrkspc_...`).
              workspace_id:,
              type: :telemetry_destination_workspace_deleted
            )
            end

            sig do
              override.returns(
                {
                  telemetry_destination_id: String,
                  type: Symbol,
                  workspace_id: String
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
end
