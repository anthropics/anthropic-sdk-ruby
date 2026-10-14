# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module TelemetryDestinations
          # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations::Workspaces#list
          class BetaTelemetryDestinationWorkspace < Anthropic::Internal::Type::BaseModel
            # @!attribute created_at
            #   Time the workspace was added to the list.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute telemetry_destination_id
            #   ID of the telemetry destination (`tdst_...`).
            #
            #   @return [String]
            required :telemetry_destination_id, String

            # @!attribute type
            #
            #   @return [Symbol, :telemetry_destination_workspace]
            required :type, const: :telemetry_destination_workspace

            # @!attribute workspace_id
            #   ID of the workspace (`wrkspc_...`).
            #
            #   @return [String]
            required :workspace_id, String

            # @!method initialize(created_at:, telemetry_destination_id:, workspace_id:, type: :telemetry_destination_workspace)
            #   A workspace on a telemetry destination's workspace list.
            #
            #   Under `include`, the destination covers the workspace. Under `exclude`, the
            #   destination covers every workspace except this one. The entry doesn't have an
            #   `id`. Its `telemetry_destination_id` and `workspace_id` together identify it.
            #
            #   @param created_at [Time] Time the workspace was added to the list.
            #
            #   @param telemetry_destination_id [String] ID of the telemetry destination (`tdst_...`).
            #
            #   @param workspace_id [String] ID of the workspace (`wrkspc_...`).
            #
            #   @param type [Symbol, :telemetry_destination_workspace]
          end
        end
      end
    end
  end
end
