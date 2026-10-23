# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class TelemetryDestinations
          class Workspaces
            # List the workspaces on a destination's workspace list, newest entry first.
            #
            # A destination whose `workspaces.type` is `all` doesn't have a list, so its page
            # is empty. The list includes archived workspaces.
            #
            # See the
            # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#choose-workspaces-for-a-destination)
            # to learn more about choosing the workspaces of a destination.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceListParams}
            # for more details.
            #
            # @overload list(destination_id, limit: nil, page: nil, betas: nil, request_options: {})
            #
            # @param destination_id [String] Path param: ID of the destination (`tdst_...`).
            #
            # @param limit [Integer] Query param: Number of entries to return per page, between 1 and 1,000. Defaults
            #
            # @param page [String] Query param: Opaque cursor from a previous response's `next_page`. Leave it out
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `telemetry-destinatio
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace>]
            #
            # @see Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceListParams
            def list(destination_id, params = {})
              query_params = [:limit, :page]
              parsed, options =
                Anthropic::Beta::Organization::TelemetryDestinations::WorkspaceListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_LIST,
                span_attributes: {"anthropic.organization.telemetry_destination.id" => destination_id},
                span_route: "/v1/organizations/telemetry_destinations/{destination_id}/workspaces",
                span_query: %w[limit page],
                method: :get,
                path: ["v1/organizations/telemetry_destinations/%1$s/workspaces?beta=true", destination_id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace,
                options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
              )
            end

            # Add one workspace to a destination's workspace list.
            #
            # Under `include` the workspace's spans start going to the destination. Under
            # `exclude` they stop. A list holds at most 1,000 workspaces.
            #
            # Adding a workspace that is already on the list changes nothing and returns the
            # existing entry. An archived workspace that isn't on the list yet can't be added.
            # A destination whose `workspaces.type` is `all` doesn't have a list, so the API
            # returns 400. To change which workspaces such a destination covers, update its
            # `workspaces`.
            #
            # See the
            # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#choose-workspaces-for-a-destination)
            # to learn more about choosing the workspaces of a destination.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceAddParams}
            # for more details.
            #
            # @overload add(workspace_id, destination_id:, betas: nil, request_options: {})
            #
            # @param workspace_id [String] Path param: ID of the workspace to add (`wrkspc_...`).
            #
            # @param destination_id [String] Path param: ID of the destination (`tdst_...`).
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `telemetry-destinatio
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace]
            #
            # @see Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceAddParams
            def add(workspace_id, params)
              parsed, options =
                Anthropic::Beta::Organization::TelemetryDestinations::WorkspaceAddParams.dump_request(params)
              destination_id =
                parsed.delete(:destination_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_ADD,
                span_attributes: {
                  "anthropic.organization.telemetry_destination.id" => destination_id,
                  "anthropic.organization.telemetry_destination.workspace.id" => workspace_id
                },
                span_route: "/v1/organizations/telemetry_destinations/{destination_id}/workspaces/{workspace_id}",
                method: :post,
                path: [
                  "v1/organizations/telemetry_destinations/%1$s/workspaces/%2$s?beta=true",
                  destination_id,
                  workspace_id
                ],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace,
                options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
              )
            end

            # Remove one workspace from a destination's workspace list.
            #
            # Under `include` the workspace's spans stop going to the destination. Under
            # `exclude` they start. An archived workspace can be removed too.
            #
            # The API returns 404 when the workspace isn't on the list. A destination whose
            # `workspaces.type` is `all` doesn't have a list, so the API returns 400.
            #
            # See the
            # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#choose-workspaces-for-a-destination)
            # to learn more about choosing the workspaces of a destination.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceRemoveParams}
            # for more details.
            #
            # @overload remove(workspace_id, destination_id:, betas: nil, request_options: {})
            #
            # @param workspace_id [String] Path param: ID of the workspace to remove (`wrkspc_...`).
            #
            # @param destination_id [String] Path param: ID of the destination (`tdst_...`).
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `telemetry-destinatio
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::TelemetryDestinations::BetaDeletedTelemetryDestinationWorkspace]
            #
            # @see Anthropic::Models::Beta::Organization::TelemetryDestinations::WorkspaceRemoveParams
            def remove(workspace_id, params)
              parsed, options =
                Anthropic::Beta::Organization::TelemetryDestinations::WorkspaceRemoveParams.dump_request(params)
              destination_id =
                parsed.delete(:destination_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_REMOVE,
                span_attributes: {
                  "anthropic.organization.telemetry_destination.id" => destination_id,
                  "anthropic.organization.telemetry_destination.workspace.id" => workspace_id
                },
                span_route: "/v1/organizations/telemetry_destinations/{destination_id}/workspaces/{workspace_id}",
                method: :delete,
                path: [
                  "v1/organizations/telemetry_destinations/%1$s/workspaces/%2$s?beta=true",
                  destination_id,
                  workspace_id
                ],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::TelemetryDestinations::BetaDeletedTelemetryDestinationWorkspace,
                options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
              )
            end

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
            end
          end
        end
      end
    end
  end
end
