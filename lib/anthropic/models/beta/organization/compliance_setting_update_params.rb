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

          # @!attribute betas
          #   Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
          #   features: additional parameters, accepted values and response fields.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(state:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ComplianceSettingUpdateParams} for more
          #   details.
          #
          #   @param state [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabledParam, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabledParam] Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta featu
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
