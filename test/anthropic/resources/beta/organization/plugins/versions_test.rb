# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Plugins::VersionsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.plugins.versions.create("plugin_id", files: [StringIO.new("Example data")])

    assert_pattern do
      response => Anthropic::Beta::Organization::Plugins::BetaPluginVersion
    end

    assert_pattern do
      response => {
        id: String,
        components: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]) | nil,
        content_scan: Anthropic::Beta::Organization::BetaPluginContentScan | nil,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy | nil,
        description: String | nil,
        display_name: String | nil,
        manifest_version: String | nil,
        plugin_id: String,
        reach: Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach | nil,
        release_notes: String | nil,
        type: Symbol
      }
    end
  end

  def test_retrieve_required_params
    response = @anthropic.beta.organization.plugins.versions.retrieve("version", plugin_id: "plugin_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Plugins::BetaPluginVersion
    end

    assert_pattern do
      response => {
        id: String,
        components: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]) | nil,
        content_scan: Anthropic::Beta::Organization::BetaPluginContentScan | nil,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy | nil,
        description: String | nil,
        display_name: String | nil,
        manifest_version: String | nil,
        plugin_id: String,
        reach: Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach | nil,
        release_notes: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.plugins.versions.list("plugin_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Plugins::BetaPluginVersion
    end

    assert_pattern do
      row => {
        id: String,
        components: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]) | nil,
        content_scan: Anthropic::Beta::Organization::BetaPluginContentScan | nil,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy | nil,
        description: String | nil,
        display_name: String | nil,
        manifest_version: String | nil,
        plugin_id: String,
        reach: Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach | nil,
        release_notes: String | nil,
        type: Symbol
      }
    end
  end

  def test_download_required_params
    response = @anthropic.beta.organization.plugins.versions.download("version", plugin_id: "plugin_id")

    assert_pattern do
      response => StringIO
    end
  end
end
