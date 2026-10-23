# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Resources
          # Get Session Resource
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceRetrieveParams} for more details.
          #
          # @overload retrieve(resource_id, session_id:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param resource_id [String] Path param
          #
          # @param session_id [String] Path param
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `managed-agents-2026-
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceRetrieveParams
          def retrieve(resource_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceRetrieveParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::SESSIONS_RESOURCES_RETRIEVE,
              span_attributes: {
                "anthropic.session.id" => session_id,
                "anthropic.session.resource.id" => resource_id
              },
              span_route: "/v1/sessions/{session_id}/resources/{resource_id}",
              method: :get,
              path: ["v1/sessions/%1$s/resources/%2$s", session_id, resource_id],
              headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
              model: Anthropic::Models::Beta::Sessions::ResourceRetrieveResponse,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Update Session Resource
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceUpdateParams} for more details.
          #
          # @overload update(resource_id, session_id:, authorization_token:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param resource_id [String] Path param
          #
          # @param session_id [String] Path param
          #
          # @param authorization_token [String] Body param: New authorization token for the resource. Currently only `github_rep
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `managed-agents-2026-
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceUpdateParams
          def update(resource_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceUpdateParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::SESSIONS_RESOURCES_UPDATE,
              span_attributes: {
                "anthropic.session.id" => session_id,
                "anthropic.session.resource.id" => resource_id
              },
              span_route: "/v1/sessions/{session_id}/resources/{resource_id}",
              method: :post,
              path: ["v1/sessions/%1$s/resources/%2$s", session_id, resource_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Models::Beta::Sessions::ResourceUpdateResponse,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # List Session Resources
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceListParams} for more details.
          #
          # @overload list(session_id, limit: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param session_id [String] Path param
          #
          # @param limit [Integer] Query param: Maximum number of resources to return per page (max 1000). If omitt
          #
          # @param page [String] Query param: Opaque cursor from a previous response's `next_page` field.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `managed-agents-2026-
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource>]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceListParams
          def list(session_id, params = {})
            query_params = [:limit, :page]
            parsed, options = Anthropic::Beta::Sessions::ResourceListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::SESSIONS_RESOURCES_LIST,
              span_attributes: {"anthropic.session.id" => session_id},
              span_route: "/v1/sessions/{session_id}/resources",
              span_query: %w[limit page],
              method: :get,
              path: ["v1/sessions/%1$s/resources", session_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Delete Session Resource
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceDeleteParams} for more details.
          #
          # @overload delete(resource_id, session_id:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param resource_id [String] Path param
          #
          # @param session_id [String] Path param
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `managed-agents-2026-
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsDeleteSessionResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceDeleteParams
          def delete(resource_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceDeleteParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::SESSIONS_RESOURCES_DELETE,
              span_attributes: {
                "anthropic.session.id" => session_id,
                "anthropic.session.resource.id" => resource_id
              },
              span_route: "/v1/sessions/{session_id}/resources/{resource_id}",
              method: :delete,
              path: ["v1/sessions/%1$s/resources/%2$s", session_id, resource_id],
              headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
              model: Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Add Session Resource
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceAddParams} for more details.
          #
          # @overload add(session_id, file_id:, mount_path: nil, betas: nil, workspace_id: nil, type: :file, request_options: {})
          #
          # @param session_id [String] Path param
          #
          # @param file_id [String] Body param: ID of a previously uploaded file.
          #
          # @param mount_path [String, nil] Body param: Mount path in the container. Defaults to `/mnt/session/uploads/<file
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `managed-agents-2026-
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param type [Symbol, :file] Body param
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceAddParams
          def add(session_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceAddParams.dump_request(params)
            header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::SESSIONS_RESOURCES_ADD,
              span_attributes: {"anthropic.session.id" => session_id},
              span_created_id: "anthropic.session.resource.id",
              span_route: "/v1/sessions/{session_id}/resources",
              method: :post,
              path: ["v1/sessions/%1$s/resources", session_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Sessions::BetaManagedAgentsFileResource,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
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
