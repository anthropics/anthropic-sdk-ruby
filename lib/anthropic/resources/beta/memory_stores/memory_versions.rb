# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class MemoryVersions
          # Retrieve a Memory Version
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryVersionRetrieveParams} for more
          # details.
          #
          # @overload retrieve(memory_version_id, memory_store_id:, view: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_version_id [String] Path param: The ID of the memory version to retrieve (`memver_...`).
          #
          # @param memory_store_id [String] Path param: The ID of the memory store that holds the version (`memstore_...`).
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Whether a `memory` or `memory_version` in the response includes its
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryVersionRetrieveParams
          def retrieve(memory_version_id, params)
            query_params = [:view]
            parsed, options = Anthropic::Beta::MemoryStores::MemoryVersionRetrieveParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            memory_store_id =
              parsed.delete(:memory_store_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORY_VERSIONS_RETRIEVE,
              span_attributes: {
                "gen_ai.memory.store.id" => memory_store_id,
                "anthropic.memory_store.memory_version.id" => memory_version_id
              },
              span_route: "/v1/memory_stores/{memory_store_id}/memory_versions/{memory_version_id}",
              span_query: %w[view],
              method: :get,
              path: [
                "v1/memory_stores/%1$s/memory_versions/%2$s?beta=true",
                memory_store_id,
                memory_version_id
              ],
              query: query,
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
              options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
            )
          end

          # List Memory Versions
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryVersionListParams} for more
          # details.
          #
          # @overload list(memory_store_id, api_key_id: nil, created_at_gte: nil, created_at_lte: nil, limit: nil, memory_id: nil, operation: nil, page: nil, service_account_id: nil, session_id: nil, view: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_store_id [String] Path param: The ID of the memory store whose version history to list
          # (`memstore\_
          #
          # @param api_key_id [String] Query param: Return only versions written with the API key that has this ID.
          #
          # @param created_at_gte [Time] Query param: Return versions created at or after this time (inclusive).
          #
          # @param created_at_lte [Time] Query param: Return versions created at or before this time (inclusive).
          #
          # @param limit [Integer] Query param: The maximum number of versions to return per page, from 1 to 100. D
          #
          # @param memory_id [String] Query param: Return only versions of the memory with this ID (`mem_...`).
          #
          # @param operation [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation] Query param: Return only versions that record this kind of change.
          #
          # @param page [String] Query param: The `next_page` value from a previous response, to get the next pag
          #
          # @param service_account_id [String] Query param: Return only versions written by the service account with this ID (`
          #
          # @param session_id [String] Query param: Return only versions written by the session with this ID.
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Whether a `memory` or `memory_version` in the response includes its
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion>]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryVersionListParams
          def list(memory_store_id, params = {})
            query_params =
              [
                :api_key_id,
                :created_at_gte,
                :created_at_lte,
                :limit,
                :memory_id,
                :operation,
                :page,
                :service_account_id,
                :session_id,
                :view
              ]
            parsed, options = Anthropic::Beta::MemoryStores::MemoryVersionListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORY_VERSIONS_LIST,
              span_attributes: {"gen_ai.memory.store.id" => memory_store_id},
              span_route: "/v1/memory_stores/{memory_store_id}/memory_versions",
              span_query: %w[
                api_key_id
                created_at[gte]
                created_at[lte]
                limit
                memory_id
                operation
                page
                service_account_id
                session_id
                view
              ],
              method: :get,
              path: ["v1/memory_stores/%1$s/memory_versions?beta=true", memory_store_id],
              query: query.transform_keys(
                created_at_gte: "created_at[gte]",
                created_at_lte: "created_at[lte]"
              ),
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
              options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
            )
          end

          # Redact a Memory Version
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryVersionRedactParams} for more
          # details.
          #
          # @overload redact(memory_version_id, memory_store_id:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_version_id [String] Path param: The ID of the memory version to redact (`memver_...`).
          #
          # @param memory_store_id [String] Path param: The ID of the memory store that holds the version (`memstore_...`).
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryVersionRedactParams
          def redact(memory_version_id, params)
            parsed, options = Anthropic::Beta::MemoryStores::MemoryVersionRedactParams.dump_request(params)
            memory_store_id =
              parsed.delete(:memory_store_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORY_VERSIONS_REDACT,
              span_attributes: {
                "gen_ai.memory.store.id" => memory_store_id,
                "anthropic.memory_store.memory_version.id" => memory_version_id
              },
              span_route: "/v1/memory_stores/{memory_store_id}/memory_versions/{memory_version_id}/redact",
              method: :post,
              path: [
                "v1/memory_stores/%1$s/memory_versions/%2$s/redact?beta=true",
                memory_store_id,
                memory_version_id
              ],
              headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
              options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
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
