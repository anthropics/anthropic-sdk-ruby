# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module TelemetryDestinations
          class BetaTelemetryDestinationWorkspace < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace,
                  Anthropic::Internal::AnyHash
                )
              end

            # Time the workspace was added to the list.
            sig { returns(Time) }
            attr_accessor :created_at

            # ID of the telemetry destination (`tdst_...`).
            sig { returns(String) }
            attr_accessor :telemetry_destination_id

            sig { returns(Symbol) }
            attr_accessor :type

            # ID of the workspace (`wrkspc_...`).
            sig { returns(String) }
            attr_accessor :workspace_id

            # A workspace on a telemetry destination's workspace list.
            #
            # Under `include`, the destination covers the workspace. Under `exclude`, the
            # destination covers every workspace except this one. The entry doesn't have an
            # `id`. Its `telemetry_destination_id` and `workspace_id` together identify it.
            sig do
              params(
                created_at: Time,
                telemetry_destination_id: String,
                workspace_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Time the workspace was added to the list.
              created_at:,
              # ID of the telemetry destination (`tdst_...`).
              telemetry_destination_id:,
              # ID of the workspace (`wrkspc_...`).
              workspace_id:,
              type: :telemetry_destination_workspace
            )
            end

            sig do
              override.returns(
                {
                  created_at: Time,
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
