# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::ComplianceSettings#update
      class ComplianceSettingUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute state
        #   Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
        #   the object form; the response always returns the canonical object form.
        #
        #   @return [Anthropic::Models::Organization::ComplianceSettingsStateEnabledParam, Anthropic::Models::Organization::ComplianceSettingsStateDisabledParam]
        required :state, union: -> { Anthropic::Organization::ComplianceSettingsStateParam }

        # @!method initialize(state:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::ComplianceSettingUpdateParams} for more
        #   details.
        #
        #   @param state [Anthropic::Models::Organization::ComplianceSettingsStateEnabledParam, Anthropic::Models::Organization::ComplianceSettingsStateDisabledParam] Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
