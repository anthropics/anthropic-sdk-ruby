# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module TelemetryDestinations
          # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations::Workspaces#list
          class WorkspaceListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute destination_id
            #   ID of the destination (`tdst_...`).
            #
            #   @return [String]
            required :destination_id, String

            # @!attribute limit
            #   Number of entries to return per page, between 1 and 1,000. Defaults to 20.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`. Leave it out to get the
            #   first page.
            #
            #   @return [String, nil]
            optional :page, String

            # @!attribute betas
            #   This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
            #   in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(destination_id:, limit: nil, page: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceListParams}
            #   for more details.
            #
            #   @param destination_id [String] ID of the destination (`tdst_...`).
            #
            #   @param limit [Integer] Number of entries to return per page, between 1 and 1,000. Defaults to 20.
            #
            #   @param page [String] Opaque cursor from a previous response's `next_page`. Leave it out to get the fi
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
