# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class TelemetryDestinations
          # @return [Anthropic::Resources::Beta::Organization::TelemetryDestinations::Workspaces]
          attr_reader :workspaces

          # Register an OpenTelemetry destination for the organization.
          #
          # The destination starts in state `enabled`. An organization can have at most 10
          # destinations, including disabled ones.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#add-a-destination)
          # to learn more about adding a destination.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::TelemetryDestinationCreateParams} for
          # more details.
          #
          # @overload create(endpoint_url:, workspaces:, display_name: nil, headers: nil, traces: nil, betas: nil, request_options: {})
          #
          # @param endpoint_url [String] Body param: The base URL of your collector's OTLP/HTTP endpoint, for example `ht
          #
          # @param workspaces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams] Body param: Which of the organization's workspaces the destination covers.
          #
          # @param display_name [String, nil] Body param: Human-readable name for the destination. Optional. 1 to 255 characte
          #
          # @param headers [Hash{Symbol=>String}] Body param: Request headers that the API sends with every delivery, typically yo
          #
          # @param traces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTracesParams] Body param: The settings for the traces that the destination receives. If you le
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `telemetry-destinatio
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestination]
          #
          # @see Anthropic::Models::Beta::Organization::TelemetryDestinationCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::TelemetryDestinationCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_CREATE,
              span_created_id: "anthropic.organization.telemetry_destination.id",
              span_route: "/v1/organizations/telemetry_destinations",
              method: :post,
              path: "v1/organizations/telemetry_destinations?beta=true",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaTelemetryDestination,
              options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
            )
          end

          # Read a destination's configuration, state, and most recent delivery results.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          # to learn how the API delivers spans and when it disables a destination.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::TelemetryDestinationRetrieveParams} for
          # more details.
          #
          # @overload retrieve(destination_id, betas: nil, request_options: {})
          #
          # @param destination_id [String] ID of the destination (`tdst_...`).
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestination]
          #
          # @see Anthropic::Models::Beta::Organization::TelemetryDestinationRetrieveParams
          def retrieve(destination_id, params = {})
            parsed, options = Anthropic::Beta::Organization::TelemetryDestinationRetrieveParams.dump_request(params)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_RETRIEVE,
              span_attributes: {"anthropic.organization.telemetry_destination.id" => destination_id},
              span_route: "/v1/organizations/telemetry_destinations/{destination_id}",
              method: :get,
              path: ["v1/organizations/telemetry_destinations/%1$s?beta=true", destination_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaTelemetryDestination,
              options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
            )
          end

          # Change a telemetry destination's settings, its state, or which workspaces it
          # covers.
          #
          # Send at least one field. Omitted fields keep their stored values, except the
          # registered headers, which a change of the endpoint's hostname or port removes.
          # Only `display_name`, `traces`, `traces.endpoint_url`, `traces.content_mode`,
          # `traces.max_content_bytes`, and individual `headers` values accept `null`.
          #
          # If another request changes the destination while the update runs, the API
          # returns a 409 `conflict_error`. Read the destination again, then retry the
          # update.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          # to learn more about changing a destination.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::TelemetryDestinationUpdateParams} for
          # more details.
          #
          # @overload update(destination_id, display_name: nil, endpoint_url: nil, headers: nil, state: nil, traces: nil, workspaces: nil, betas: nil, request_options: {})
          #
          # @param destination_id [String] Path param: ID of the destination (`tdst_...`).
          #
          # @param display_name [String, nil] Body param: New human-readable name, 1 to 255 characters. Null clears it.
          #
          # @param endpoint_url [String] Body param: The new base URL of the destination's OTLP/HTTP endpoint. The same r
          #
          # @param headers [Hash{Symbol=>String, nil}, nil] Body param: Headers to set or remove. The API merges them into the destination's
          #
          # @param state [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabledParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabledParams] Body param: Whether the destination receives deliveries after the update. The fi
          #
          # @param traces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTracesParams, nil] Body param: The traces settings to change. Omitted settings keep their stored va
          #
          # @param workspaces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams] Body param: The new workspace scope, in the same form as on create. The field ca
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `telemetry-destinatio
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestination]
          #
          # @see Anthropic::Models::Beta::Organization::TelemetryDestinationUpdateParams
          def update(destination_id, params = {})
            parsed, options = Anthropic::Beta::Organization::TelemetryDestinationUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_UPDATE,
              span_attributes: {"anthropic.organization.telemetry_destination.id" => destination_id},
              span_route: "/v1/organizations/telemetry_destinations/{destination_id}",
              method: :post,
              path: ["v1/organizations/telemetry_destinations/%1$s?beta=true", destination_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaTelemetryDestination,
              options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
            )
          end

          # List the organization's destinations, newest first, optionally only those that
          # cover given workspaces.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#set-up-api-tracing)
          # to learn more about destinations.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::TelemetryDestinationListParams} for more
          # details.
          #
          # @overload list(limit: nil, page: nil, workspace_ids: nil, betas: nil, request_options: {})
          #
          # @param limit [Integer] Query param: Number of destinations to return per page, between 1 and 1,000. Def
          #
          # @param page [String] Query param: Opaque cursor from a previous response's `next_page`. Leave it out
          #
          # @param workspace_ids [Array<String>] Query param: Return only the destinations that cover at least one of these works
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `telemetry-destinatio
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaTelemetryDestination>]
          #
          # @see Anthropic::Models::Beta::Organization::TelemetryDestinationListParams
          def list(params = {})
            query_params = [:limit, :page, :workspace_ids]
            parsed, options = Anthropic::Beta::Organization::TelemetryDestinationListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_LIST,
              span_route: "/v1/organizations/telemetry_destinations",
              span_query: %w[limit page workspace_ids],
              method: :get,
              path: "v1/organizations/telemetry_destinations?beta=true",
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaTelemetryDestination,
              options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
            )
          end

          # Delete a destination and its workspace list.
          #
          # The API stops sending spans to the destination. The spans of the workspaces it
          # covered still go to the other destinations that cover them. A deleted
          # destination can't be read, listed, or restored.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          # to learn more about managing a destination.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::TelemetryDestinationDeleteParams} for
          # more details.
          #
          # @overload delete(destination_id, betas: nil, request_options: {})
          #
          # @param destination_id [String] ID of the destination (`tdst_...`).
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaDeletedTelemetryDestination]
          #
          # @see Anthropic::Models::Beta::Organization::TelemetryDestinationDeleteParams
          def delete(destination_id, params = {})
            parsed, options = Anthropic::Beta::Organization::TelemetryDestinationDeleteParams.dump_request(params)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_DELETE,
              span_attributes: {"anthropic.organization.telemetry_destination.id" => destination_id},
              span_route: "/v1/organizations/telemetry_destinations/{destination_id}",
              method: :delete,
              path: ["v1/organizations/telemetry_destinations/%1$s?beta=true", destination_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaDeletedTelemetryDestination,
              options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
            )
          end

          # Send one test span, named `anthropic.test`, to the destination with its
          # registered headers, once and without retries, and report the destination's
          # answer. The response is 200 whether or not the destination answered with a 2xx
          # status: its `result` has the type `success`, or the type `failure` and the
          # reason in `error`. The destination's configuration, `state` and
          # `delivery_health` do not change. A disabled destination can be tested too. Wait
          # 10 seconds between tests of one destination; a request that comes sooner may be
          # answered with status 429.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::TelemetryDestinationTestParams} for more
          # details.
          #
          # @overload test_(destination_id, betas: nil, request_options: {})
          #
          # @param destination_id [String] ID of the destination to test (starts with `tdst_`).
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTestResponse]
          #
          # @see Anthropic::Models::Beta::Organization::TelemetryDestinationTestParams
          def test_(destination_id, params = {})
            parsed, options = Anthropic::Beta::Organization::TelemetryDestinationTestParams.dump_request(params)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_TELEMETRY_DESTINATIONS_TEST,
              span_attributes: {"anthropic.organization.telemetry_destination.id" => destination_id},
              span_route: "/v1/organizations/telemetry_destinations/{destination_id}/test",
              method: :post,
              path: ["v1/organizations/telemetry_destinations/%1$s/test?beta=true", destination_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaTelemetryDestinationTestResponse,
              options: {extra_headers: {"anthropic-beta" => "telemetry-destinations-2026-08-11"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @workspaces =
              Anthropic::Resources::Beta::Organization::TelemetryDestinations::Workspaces.new(client: client)
          end
        end
      end
    end
  end
end
