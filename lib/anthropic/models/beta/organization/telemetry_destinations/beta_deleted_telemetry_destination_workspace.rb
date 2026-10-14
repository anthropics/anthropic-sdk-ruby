# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module TelemetryDestinations
          # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations::Workspaces#remove
          class BetaDeletedTelemetryDestinationWorkspace < Anthropic::Internal::Type::BaseModel
            # @!attribute telemetry_destination_id
            #   ID of the telemetry destination (`tdst_...`).
            #
            #   @return [String]
            required :telemetry_destination_id, String

            # @!attribute type
            #
            #   @return [Symbol, :telemetry_destination_workspace_deleted]
            required :type, const: :telemetry_destination_workspace_deleted

            # @!attribute workspace_id
            #   ID of the workspace that was removed (`wrkspc_...`).
            #
            #   @return [String]
            required :workspace_id, String

            # @!method initialize(telemetry_destination_id:, workspace_id:, type: :telemetry_destination_workspace_deleted)
            #   Confirmation that a workspace was removed from a destination's list.
            #
            #   @param telemetry_destination_id [String] ID of the telemetry destination (`tdst_...`).
            #
            #   @param workspace_id [String] ID of the workspace that was removed (`wrkspc_...`).
            #
            #   @param type [Symbol, :telemetry_destination_workspace_deleted]
          end
        end
      end
    end
  end
end
