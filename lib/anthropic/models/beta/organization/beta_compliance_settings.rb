# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ComplianceSettings#retrieve
        class BetaComplianceSettings < Anthropic::Internal::Type::BaseModel
          # @!attribute state
          #   Whether the Compliance API is enabled for this organization.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabled, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabled]
          required :state, union: -> { Anthropic::Beta::Organization::BetaComplianceSettingsState }

          # @!attribute type
          #
          #   @return [Symbol, :compliance_settings]
          required :type, const: :compliance_settings

          # @!method initialize(state:, type: :compliance_settings)
          #   @param state [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabled, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabled] Whether the Compliance API is enabled for this organization.
          #
          #   @param type [Symbol, :compliance_settings]
        end
      end
    end
  end
end
