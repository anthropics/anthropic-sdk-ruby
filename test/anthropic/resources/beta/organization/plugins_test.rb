# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::PluginsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.organization.plugins.create(files: [StringIO.new("Example data")])

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaPlugin
    end

    assert_pattern do
      response => {
        id: String,
        components: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]) | nil,
        content_scan: Anthropic::Beta::Organization::BetaPluginContentScan | nil,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::BetaPlugin::CreatedBy | nil,
        description: String | nil,
        display_name: String | nil,
        latest_version_id: String,
        manifest_version: String | nil,
        marketplace_id: String,
        name: String,
        organization_installation_preference: Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference | nil,
        organization_installation_preference_inherited: Anthropic::Internal::Type::Boolean | nil,
        owner: Anthropic::Beta::Organization::BetaPlugin::Owner,
        reach: Anthropic::Beta::Organization::BetaPlugin::Reach | nil,
        served_version_id: String,
        served_version_pinned: Anthropic::Internal::Type::Boolean,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.organization.plugins.retrieve("plugin_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaPlugin
    end

    assert_pattern do
      response => {
        id: String,
        components: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]) | nil,
        content_scan: Anthropic::Beta::Organization::BetaPluginContentScan | nil,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::BetaPlugin::CreatedBy | nil,
        description: String | nil,
        display_name: String | nil,
        latest_version_id: String,
        manifest_version: String | nil,
        marketplace_id: String,
        name: String,
        organization_installation_preference: Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference | nil,
        organization_installation_preference_inherited: Anthropic::Internal::Type::Boolean | nil,
        owner: Anthropic::Beta::Organization::BetaPlugin::Owner,
        reach: Anthropic::Beta::Organization::BetaPlugin::Reach | nil,
        served_version_id: String,
        served_version_pinned: Anthropic::Internal::Type::Boolean,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.plugins.update(
        "plugin_id",
        served_version_id: "pluginver_01KaZmQpRsTuVwXyZ2b4c6d8"
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaPlugin
    end

    assert_pattern do
      response => {
        id: String,
        components: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]) | nil,
        content_scan: Anthropic::Beta::Organization::BetaPluginContentScan | nil,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::BetaPlugin::CreatedBy | nil,
        description: String | nil,
        display_name: String | nil,
        latest_version_id: String,
        manifest_version: String | nil,
        marketplace_id: String,
        name: String,
        organization_installation_preference: Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference | nil,
        organization_installation_preference_inherited: Anthropic::Internal::Type::Boolean | nil,
        owner: Anthropic::Beta::Organization::BetaPlugin::Owner,
        reach: Anthropic::Beta::Organization::BetaPlugin::Reach | nil,
        served_version_id: String,
        served_version_pinned: Anthropic::Internal::Type::Boolean,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.plugins.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaPlugin
    end

    assert_pattern do
      row => {
        id: String,
        components: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]) | nil,
        content_scan: Anthropic::Beta::Organization::BetaPluginContentScan | nil,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::BetaPlugin::CreatedBy | nil,
        description: String | nil,
        display_name: String | nil,
        latest_version_id: String,
        manifest_version: String | nil,
        marketplace_id: String,
        name: String,
        organization_installation_preference: Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference | nil,
        organization_installation_preference_inherited: Anthropic::Internal::Type::Boolean | nil,
        owner: Anthropic::Beta::Organization::BetaPlugin::Owner,
        reach: Anthropic::Beta::Organization::BetaPlugin::Reach | nil,
        served_version_id: String,
        served_version_pinned: Anthropic::Internal::Type::Boolean,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @anthropic.beta.organization.plugins.delete("plugin_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaDeletedPlugin
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end
