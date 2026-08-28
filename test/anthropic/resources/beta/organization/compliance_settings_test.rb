# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ComplianceSettingsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.beta.organization.compliance_settings.retrieve

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaComplianceSettings
    end

    assert_pattern do
      response => {
        state: Anthropic::Beta::Organization::BetaComplianceSettings::State,
        type: Symbol
      }
    end
  end

  def test_update_required_params
    response = @anthropic.beta.organization.compliance_settings.update(state: {type: :enabled})

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaComplianceSettings
    end

    assert_pattern do
      response => {
        state: Anthropic::Beta::Organization::BetaComplianceSettings::State,
        type: Symbol
      }
    end
  end
end
