# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::ComplianceSettings#retrieve
      class OrganizationComplianceSettings < Anthropic::Internal::Type::BaseModel
        # @!attribute state
        #   Whether the Compliance API is enabled for this organization.
        #
        #   @return [Anthropic::Models::Organization::ComplianceSettingsStateEnabled, Anthropic::Models::Organization::ComplianceSettingsStateDisabled]
        required :state, union: -> { Anthropic::Organization::ComplianceSettingsState }

        # @!attribute type
        #
        #   @return [Symbol, :compliance_settings]
        required :type, const: :compliance_settings

        # @!method initialize(state:, type: :compliance_settings)
        #   @param state [Anthropic::Models::Organization::ComplianceSettingsStateEnabled, Anthropic::Models::Organization::ComplianceSettingsStateDisabled] Whether the Compliance API is enabled for this organization.
        #
        #   @param type [Symbol, :compliance_settings]
      end
    end

    OrganizationComplianceSettings = Organization::OrganizationComplianceSettings
  end
end
