# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module TelemetryDestinations
          # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations::Workspaces#add
          class WorkspaceAddParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute destination_id
            #   ID of the destination (`tdst_...`).
            #
            #   @return [String]
            required :destination_id, String

            # @!attribute workspace_id
            #   ID of the workspace to add (`wrkspc_...`).
            #
            #   @return [String]
            required :workspace_id, String

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(destination_id:, workspace_id:, betas: nil, request_options: {})
            #   @param destination_id [String] ID of the destination (`tdst_...`).
            #
            #   @param workspace_id [String] ID of the workspace to add (`wrkspc_...`).
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
