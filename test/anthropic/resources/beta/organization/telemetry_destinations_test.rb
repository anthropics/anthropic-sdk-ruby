# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::TelemetryDestinationsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.telemetry_destinations.create(endpoint_url: "x", workspaces: {type: :all})

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaTelemetryDestination
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        delivery_health: Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth,
        display_name: String | nil,
        endpoint_url: String,
        header_names: ^(Anthropic::Internal::Type::ArrayOf[String]),
        state: Anthropic::Beta::Organization::BetaTelemetryDestinationState,
        traces: Anthropic::Beta::Organization::BetaTelemetryDestinationTraces,
        type: Symbol,
        updated_at: Time,
        workspaces: Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.organization.telemetry_destinations.retrieve("destination_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaTelemetryDestination
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        delivery_health: Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth,
        display_name: String | nil,
        endpoint_url: String,
        header_names: ^(Anthropic::Internal::Type::ArrayOf[String]),
        state: Anthropic::Beta::Organization::BetaTelemetryDestinationState,
        traces: Anthropic::Beta::Organization::BetaTelemetryDestinationTraces,
        type: Symbol,
        updated_at: Time,
        workspaces: Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces
      }
    end
  end

  def test_update
    response = @anthropic.beta.organization.telemetry_destinations.update("destination_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaTelemetryDestination
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        delivery_health: Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth,
        display_name: String | nil,
        endpoint_url: String,
        header_names: ^(Anthropic::Internal::Type::ArrayOf[String]),
        state: Anthropic::Beta::Organization::BetaTelemetryDestinationState,
        traces: Anthropic::Beta::Organization::BetaTelemetryDestinationTraces,
        type: Symbol,
        updated_at: Time,
        workspaces: Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.telemetry_destinations.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaTelemetryDestination
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        delivery_health: Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth,
        display_name: String | nil,
        endpoint_url: String,
        header_names: ^(Anthropic::Internal::Type::ArrayOf[String]),
        state: Anthropic::Beta::Organization::BetaTelemetryDestinationState,
        traces: Anthropic::Beta::Organization::BetaTelemetryDestinationTraces,
        type: Symbol,
        updated_at: Time,
        workspaces: Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces
      }
    end
  end

  def test_delete
    response = @anthropic.beta.organization.telemetry_destinations.delete("destination_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaDeletedTelemetryDestination
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end
