# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::PluginMarketplacesTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.beta.organization.plugin_marketplaces.retrieve("marketplace_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaPluginMarketplace
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        default_installation_preference: Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference | nil,
        last_sync_ended_at: Time | nil,
        last_sync_read_sha: String | nil,
        name: String,
        owner: Anthropic::Beta::Organization::BetaPluginMarketplace::Owner,
        source: Anthropic::Beta::Organization::BetaPluginMarketplace::Source,
        sync_status: Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus | nil,
        type: Symbol
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.plugin_marketplaces.update(
        "marketplace_id",
        default_installation_preference: :available
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaPluginMarketplace
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        default_installation_preference: Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference | nil,
        last_sync_ended_at: Time | nil,
        last_sync_read_sha: String | nil,
        name: String,
        owner: Anthropic::Beta::Organization::BetaPluginMarketplace::Owner,
        source: Anthropic::Beta::Organization::BetaPluginMarketplace::Source,
        sync_status: Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.plugin_marketplaces.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaPluginMarketplace
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        default_installation_preference: Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference | nil,
        last_sync_ended_at: Time | nil,
        last_sync_read_sha: String | nil,
        name: String,
        owner: Anthropic::Beta::Organization::BetaPluginMarketplace::Owner,
        source: Anthropic::Beta::Organization::BetaPluginMarketplace::Source,
        sync_status: Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus | nil,
        type: Symbol
      }
    end
  end

  def test_validate_archive_required_params
    response =
      @anthropic.beta.organization.plugin_marketplaces.validate_archive(archive: StringIO.new("Example data"))

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaPluginMarketplaceValidationReport
    end

    assert_pattern do
      response => {
        commit_sha: String | nil,
        manifest_error: String | nil,
        manifest_error_code: String | nil,
        plugin_errors: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginError]),
        plugin_warnings: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings]),
        ref: String | nil,
        total_plugin_count: Integer,
        type: Symbol,
        valid: Anthropic::Internal::Type::Boolean
      }
    end
  end

  def test_validate_repository_required_params
    response =
      @anthropic.beta.organization.plugin_marketplaces.validate_repository(
        repository_url: "https://github.com/example-org/example-marketplace"
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaPluginMarketplaceValidationReport
    end

    assert_pattern do
      response => {
        commit_sha: String | nil,
        manifest_error: String | nil,
        manifest_error_code: String | nil,
        plugin_errors: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginError]),
        plugin_warnings: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings]),
        ref: String | nil,
        total_plugin_count: Integer,
        type: Symbol,
        valid: Anthropic::Internal::Type::Boolean
      }
    end
  end
end
