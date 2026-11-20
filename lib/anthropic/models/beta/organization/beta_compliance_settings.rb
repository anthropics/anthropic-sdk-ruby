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

          # @!attribute access_transparency
          #   Read-only. Whether Access Transparency is on for the organization. Returned only
          #   when the request sends the `anthropic-beta: efs-2026-10-01` header and Access
          #   Transparency is available to the organization; otherwise omitted. If the status
          #   can't be read, getting Compliance Settings returns an error; an update still
          #   saves, but then reports `disabled` whatever the real status, so get the settings
          #   again to check it.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAccessTransparency, nil]
          optional :access_transparency, -> { Anthropic::Beta::Organization::BetaAccessTransparency }

          # @!method initialize(state:, access_transparency: nil, type: :compliance_settings)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaComplianceSettings} for more
          #   details.
          #
          #   @param state [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabled, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabled] Whether the Compliance API is enabled for this organization.
          #
          #   @param access_transparency [Anthropic::Models::Beta::Organization::BetaAccessTransparency] Read-only. Whether Access Transparency is on for the organization. Returned only
          #
          #   @param type [Symbol, :compliance_settings]
        end
      end
    end
  end
end
