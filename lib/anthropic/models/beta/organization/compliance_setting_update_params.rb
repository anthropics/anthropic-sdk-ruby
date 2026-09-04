# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ComplianceSettings#update
        class ComplianceSettingUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute state
          #   Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
          #   the object form; the response always returns the canonical object form.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabledParam, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabledParam]
          required :state, union: -> { Anthropic::Beta::Organization::BetaComplianceSettingsStateParam }

          # @!method initialize(state:, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ComplianceSettingUpdateParams} for more
          #   details.
          #
          #   @param state [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabledParam, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabledParam] Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
