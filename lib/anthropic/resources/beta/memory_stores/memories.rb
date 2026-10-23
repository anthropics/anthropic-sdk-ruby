# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class Memories
          # Create a Memory
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryCreateParams} for more details.
          #
          # @overload create(memory_store_id, content:, path:, view: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_store_id [String] Path param: The ID of the memory store to create the memory in (`memstore_...`).
          #
          # @param content [String, nil] Body param: The UTF-8 text content of the new memory. Pass `""` to create an emp
          #
          # @param path [String] Body param: The path of the new memory, such as `/projects/foo/notes.md`. Paths
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Whether a `memory` or `memory_version` in the response includes its
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryCreateParams
          def create(memory_store_id, params)
            query_params = [:view]
            header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
            parsed, options = Anthropic::Beta::MemoryStores::MemoryCreateParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORIES_CREATE,
              span_attributes: {"gen_ai.memory.store.id" => memory_store_id},
              span_created_id: "gen_ai.memory.record.id",
              span_route: "/v1/memory_stores/{memory_store_id}/memories",
              span_query: %w[view],
              method: :post,
              path: ["v1/memory_stores/%1$s/memories", memory_store_id],
              query: query,
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*query_params, *header_params.keys),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
              options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
            )
          end

          # Retrieve a Memory
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryRetrieveParams} for more details.
          #
          # @overload retrieve(memory_id, memory_store_id:, view: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_id [String] Path param: The ID of the memory to retrieve (`mem_...`).
          #
          # @param memory_store_id [String] Path param: The ID of the memory store that holds the memory (`memstore_...`).
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Whether a `memory` or `memory_version` in the response includes its
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryRetrieveParams
          def retrieve(memory_id, params)
            query_params = [:view]
            parsed, options = Anthropic::Beta::MemoryStores::MemoryRetrieveParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            memory_store_id =
              parsed.delete(:memory_store_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORIES_RETRIEVE,
              span_attributes: {
                "gen_ai.memory.store.id" => memory_store_id,
                "gen_ai.memory.record.id" => memory_id
              },
              span_route: "/v1/memory_stores/{memory_store_id}/memories/{memory_id}",
              span_query: %w[view],
              method: :get,
              path: ["v1/memory_stores/%1$s/memories/%2$s", memory_store_id, memory_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
              options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
            )
          end

          # Update a Memory
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryUpdateParams} for more details.
          #
          # @overload update(memory_id, memory_store_id:, view: nil, content: nil, path: nil, precondition: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_id [String] Path param: The ID of the memory to update (`mem_...`).
          #
          # @param memory_store_id [String] Path param: The ID of the memory store that holds the memory (`memstore_...`).
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Whether a `memory` or `memory_version` in the response includes its
          #
          # @param content [String, nil] Body param: New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes
          #
          # @param path [String, nil] Body param: The new path of the memory, which renames it. Omit it to keep the cu
          #
          # @param precondition [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition] Body param: The condition that the memory must meet for the update to apply. Omi
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryUpdateParams
          def update(memory_id, params)
            query_params = [:view]
            header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
            parsed, options = Anthropic::Beta::MemoryStores::MemoryUpdateParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            memory_store_id =
              parsed.delete(:memory_store_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORIES_UPDATE,
              span_attributes: {
                "gen_ai.memory.store.id" => memory_store_id,
                "gen_ai.memory.record.id" => memory_id
              },
              span_route: "/v1/memory_stores/{memory_store_id}/memories/{memory_id}",
              span_query: %w[view],
              method: :post,
              path: ["v1/memory_stores/%1$s/memories/%2$s", memory_store_id, memory_id],
              query: query,
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*query_params, *header_params.keys),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
              options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
            )
          end

          # List Memories
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryListParams} for more details.
          #
          # @overload list(memory_store_id, depth: nil, limit: nil, page: nil, path_prefix: nil, view: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_store_id [String] Path param: The ID of the memory store to list memories from (`memstore_...`).
          #
          # @param depth [Integer] Query param: How far below `path_prefix` to list. Defaults to `0`, which lists e
          #
          # @param limit [Integer] Query param: The maximum number of items to return per page, from 1 to 100. Defa
          #
          # @param page [String] Query param: The `next_page` value from a previous response, to get the next pag
          #
          # @param path_prefix [String] Query param: Return only memories whose path starts with this prefix, such as `/
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Whether each memory in the response includes `content`. Defaults to
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix>]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryListParams
          def list(memory_store_id, params = {})
            query_params = [:depth, :limit, :page, :path_prefix, :view]
            parsed, options = Anthropic::Beta::MemoryStores::MemoryListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORIES_LIST,
              span_attributes: {"gen_ai.memory.store.id" => memory_store_id},
              span_route: "/v1/memory_stores/{memory_store_id}/memories",
              span_query: %w[depth limit page path_prefix view],
              span_content_query: %w[page],
              method: :get,
              path: ["v1/memory_stores/%1$s/memories", memory_store_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem,
              options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
            )
          end

          # Delete a Memory
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryDeleteParams} for more details.
          #
          # @overload delete(memory_id, memory_store_id:, expected_content_sha256: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param memory_id [String] Path param: The ID of the memory to delete (`mem_...`).
          #
          # @param memory_store_id [String] Path param: The ID of the memory store that holds the memory (`memstore_...`).
          #
          # @param expected_content_sha256 [String] Query param: Delete the memory only if its current `content_sha256` equals this
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsDeletedMemory]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryDeleteParams
          def delete(memory_id, params)
            query_params = [:expected_content_sha256]
            parsed, options = Anthropic::Beta::MemoryStores::MemoryDeleteParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            memory_store_id =
              parsed.delete(:memory_store_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_MEMORIES_DELETE,
              span_attributes: {
                "gen_ai.memory.store.id" => memory_store_id,
                "gen_ai.memory.record.id" => memory_id
              },
              span_route: "/v1/memory_stores/{memory_store_id}/memories/{memory_id}",
              span_query: %w[expected_content_sha256],
              method: :delete,
              path: ["v1/memory_stores/%1$s/memories/%2$s", memory_store_id, memory_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory,
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
