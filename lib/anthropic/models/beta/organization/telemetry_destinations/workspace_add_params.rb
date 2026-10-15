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
            #   This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
            #   in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(destination_id:, workspace_id:, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceAddParams}
            #   for more details.
            #
            #   @param destination_id [String] ID of the destination (`tdst_...`).
            #
            #   @param workspace_id [String] ID of the workspace to add (`wrkspc_...`).
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
