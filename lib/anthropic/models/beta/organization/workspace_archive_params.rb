# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Workspaces#archive
        class WorkspaceArchiveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute workspace_id
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute betas
          #   Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
          #   features: additional parameters, accepted values and response fields.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(workspace_id:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WorkspaceArchiveParams} for more
          #   details.
          #
          #   @param workspace_id [String]
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta featu
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
