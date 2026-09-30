# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Organization::ComplianceSettingsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.organization.compliance_settings.retrieve

    assert_pattern do
      response => Anthropic::Organization::OrganizationComplianceSettings
    end

    assert_pattern do
      response => {
        state: Anthropic::Organization::ComplianceSettingsState,
        type: Symbol
      }
    end
  end

  def test_update_required_params
    response = @anthropic.organization.compliance_settings.update(state: {type: :enabled})

    assert_pattern do
      response => Anthropic::Organization::OrganizationComplianceSettings
    end

    assert_pattern do
      response => {
        state: Anthropic::Organization::ComplianceSettingsState,
        type: Symbol
      }
    end
  end
end
