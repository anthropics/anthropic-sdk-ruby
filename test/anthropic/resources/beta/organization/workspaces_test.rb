# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::WorkspacesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.organization.workspaces.create(name: "x")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaWorkspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Beta::Organization::BetaDataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.organization.workspaces.retrieve("workspace_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaWorkspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Beta::Organization::BetaDataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_update
    response = @anthropic.beta.organization.workspaces.update("workspace_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaWorkspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Beta::Organization::BetaDataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.workspaces.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaWorkspace
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Beta::Organization::BetaDataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_archive
    response = @anthropic.beta.organization.workspaces.archive("workspace_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaWorkspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Beta::Organization::BetaDataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end
end
