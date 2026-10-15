# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations#list
        class TelemetryDestinationListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute limit
          #   Number of destinations to return per page, between 1 and 1,000. Defaults to 20.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque cursor from a previous response's `next_page`. Leave it out to get the
          #   first page.
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute workspace_ids
          #   Return only the destinations that cover at least one of these workspaces
          #   (`wrkspc_...`).
          #
          #   Send at most 100 IDs, as `workspace_ids[]`. A destination covers a workspace
          #   when its `workspaces.type` is `all`, when its `include` list has the workspace,
          #   or when its `exclude` list doesn't have it. Destinations in either state can
          #   match. An ID that isn't the ID of one of the organization's workspaces doesn't
          #   match any destination, not even one whose type is `all`.
          #
          #   @return [Array<String>, nil]
          optional :workspace_ids, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute betas
          #   This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          #   in this header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(limit: nil, page: nil, workspace_ids: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::TelemetryDestinationListParams} for more
          #   details.
          #
          #   @param limit [Integer] Number of destinations to return per page, between 1 and 1,000. Defaults to 20.
          #
          #   @param page [String] Opaque cursor from a previous response's `next_page`. Leave it out to get the fi
          #
          #   @param workspace_ids [Array<String>] Return only the destinations that cover at least one of these workspaces (`wrksp
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
