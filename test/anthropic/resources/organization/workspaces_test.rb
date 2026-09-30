# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Organization::WorkspacesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.organization.workspaces.create(name: "x")

    assert_pattern do
      response => Anthropic::Organization::Workspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Organization::DataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @anthropic.organization.workspaces.retrieve("workspace_id")

    assert_pattern do
      response => Anthropic::Organization::Workspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Organization::DataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_update
    response = @anthropic.organization.workspaces.update("workspace_id")

    assert_pattern do
      response => Anthropic::Organization::Workspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Organization::DataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.organization.workspaces.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::Workspace
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Organization::DataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end

  def test_archive
    response = @anthropic.organization.workspaces.archive("workspace_id")

    assert_pattern do
      response => Anthropic::Organization::Workspace
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        compartment_id: String,
        created_at: Time,
        data_residency: Anthropic::Organization::DataResidency,
        display_color: String,
        external_key_id: String | nil,
        name: String,
        tags: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Symbol
      }
    end
  end
end
