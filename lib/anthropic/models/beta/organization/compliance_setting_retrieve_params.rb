# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ComplianceSettings#retrieve
        class ComplianceSettingRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute betas
          #   Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
          #   features: additional parameters, accepted values and response fields.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ComplianceSettingRetrieveParams} for
          #   more details.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta featu
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
