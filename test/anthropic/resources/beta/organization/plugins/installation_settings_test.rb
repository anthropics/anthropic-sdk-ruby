# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Plugins::InstallationSettingsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.plugins.installation_settings.list("plugin_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting
    end

    assert_pattern do
      row => {
        created_at: Time,
        installation_preference: Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference,
        plugin_id: String,
        target: Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_remove_required_params
    response =
      @anthropic.beta.organization.plugins.installation_settings.remove("target", plugin_id: "plugin_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting
    end

    assert_pattern do
      response => {
        plugin_id: String,
        target: Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target,
        type: Symbol
      }
    end
  end

  def test_set_required_params
    response =
      @anthropic.beta.organization.plugins.installation_settings.set(
        "target",
        plugin_id: "plugin_id",
        installation_preference: :required
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting
    end

    assert_pattern do
      response => {
        created_at: Time,
        installation_preference: Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference,
        plugin_id: String,
        target: Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target,
        type: Symbol,
        updated_at: Time
      }
    end
  end
end
