# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::TelemetryDestinations::WorkspacesTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.telemetry_destinations.workspaces.list("destination_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace
    end

    assert_pattern do
      row => {
        created_at: Time,
        telemetry_destination_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end

  def test_add_required_params
    response =
      @anthropic.beta.organization.telemetry_destinations.workspaces.add(
        "workspace_id",
        destination_id: "destination_id"
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace
    end

    assert_pattern do
      response => {
        created_at: Time,
        telemetry_destination_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end

  def test_remove_required_params
    response =
      @anthropic.beta.organization.telemetry_destinations.workspaces.remove(
        "workspace_id",
        destination_id: "destination_id"
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::TelemetryDestinations::BetaDeletedTelemetryDestinationWorkspace
    end

    assert_pattern do
      response => {
        telemetry_destination_id: String,
        type: Symbol,
        workspace_id: String
      }
    end
  end
end
