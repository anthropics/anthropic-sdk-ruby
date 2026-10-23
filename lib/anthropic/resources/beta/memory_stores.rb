# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        # @return [Anthropic::Resources::Beta::MemoryStores::Memories]
        attr_reader :memories

        # @return [Anthropic::Resources::Beta::MemoryStores::MemoryVersions]
        attr_reader :memory_versions

        # Create a Memory Store
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MemoryStoreCreateParams} for more details.
        #
        # @overload create(name:, description: nil, metadata: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param name [String] Body param: The name of the memory store, 1 to 255 characters long, without cont
        #
        # @param description [String] Body param: Free-text description of what the store contains, up to 1,024 charac
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Key-value pairs for your own use, such as the end user that the stor
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::MemoryStoreCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
          @client.request(
            qualifiers: {beta: "true"},
            span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_CREATE,
            span_created_id: "gen_ai.memory.store.id",
            span_route: "/v1/memory_stores",
            method: :post,
            path: "v1/memory_stores",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
          )
        end

        # Retrieve a Memory Store
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MemoryStoreRetrieveParams} for more details.
        #
        # @overload retrieve(memory_store_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param memory_store_id [String] The ID of the memory store to retrieve (`memstore_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `agent-memory-2026-07-22` or `manag
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreRetrieveParams
        def retrieve(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreRetrieveParams.dump_request(params)
          @client.request(
            qualifiers: {beta: "true"},
            span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_RETRIEVE,
            span_attributes: {"gen_ai.memory.store.id" => memory_store_id},
            span_route: "/v1/memory_stores/{memory_store_id}",
            method: :get,
            path: ["v1/memory_stores/%1$s", memory_store_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
          )
        end

        # Update a Memory Store
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MemoryStoreUpdateParams} for more details.
        #
        # @overload update(memory_store_id, description: nil, metadata: nil, name: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param memory_store_id [String] Path param: The ID of the memory store to update (`memstore_...`).
        #
        # @param description [String, nil] Body param: New description for the store, up to 1,024 characters. Pass an empty
        #
        # @param metadata [Hash{Symbol=>String, nil}, nil] Body param: Changes to apply to the memory store's metadata. Keys you leave out
        #
        # @param name [String, nil] Body param: The new name of the memory store, 1 to 255 characters long, without
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreUpdateParams
        def update(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
          @client.request(
            qualifiers: {beta: "true"},
            span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_UPDATE,
            span_attributes: {"gen_ai.memory.store.id" => memory_store_id},
            span_route: "/v1/memory_stores/{memory_store_id}",
            method: :post,
            path: ["v1/memory_stores/%1$s", memory_store_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
          )
        end

        # List Memory Stores
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MemoryStoreListParams} for more details.
        #
        # @overload list(created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param created_at_gte [Time] Query param: Return only memory stores created at or after this time (inclusive)
        #
        # @param created_at_lte [Time] Query param: Return only memory stores created at or before this time (inclusive
        #
        # @param include_archived [Boolean] Query param: When `true`, archived stores are included in the results. Defaults
        #
        # @param limit [Integer] Query param: Maximum number of stores to return per page. Must be between 1 and
        #
        # @param page [String] Query param: The `next_page` value from a previous response, to get the next pag
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `agent-memory-2026-07
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaManagedAgentsMemoryStore>]
        #
        # @see Anthropic::Models::Beta::MemoryStoreListParams
        def list(params = {})
          query_params = [:created_at_gte, :created_at_lte, :include_archived, :limit, :page]
          parsed, options = Anthropic::Beta::MemoryStoreListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            qualifiers: {beta: "true"},
            span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_LIST,
            span_route: "/v1/memory_stores",
            span_query: %w[created_at[gte] created_at[lte] include_archived limit page],
            method: :get,
            path: "v1/memory_stores",
            query: query.transform_keys(created_at_gte: "created_at[gte]", created_at_lte: "created_at[lte]"),
            headers: parsed.except(*query_params).transform_keys(
              betas: "anthropic-beta",
              workspace_id: "anthropic-workspace-id"
            ),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
          )
        end

        # Delete a Memory Store
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MemoryStoreDeleteParams} for more details.
        #
        # @overload delete(memory_store_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param memory_store_id [String] The ID of the memory store to delete (`memstore_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `agent-memory-2026-07-22` or `manag
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreDeleteParams
        def delete(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreDeleteParams.dump_request(params)
          @client.request(
            qualifiers: {beta: "true"},
            span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_DELETE,
            span_attributes: {"gen_ai.memory.store.id" => memory_store_id},
            span_route: "/v1/memory_stores/{memory_store_id}",
            method: :delete,
            path: ["v1/memory_stores/%1$s", memory_store_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
          )
        end

        # Archive a Memory Store
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MemoryStoreArchiveParams} for more details.
        #
        # @overload archive(memory_store_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param memory_store_id [String] The ID of the memory store to archive (`memstore_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `agent-memory-2026-07-22` or `manag
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreArchiveParams
        def archive(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreArchiveParams.dump_request(params)
          @client.request(
            qualifiers: {beta: "true"},
            span_name: Anthropic::Internal::Tracing::SpanName::MEMORY_STORES_ARCHIVE,
            span_attributes: {"gen_ai.memory.store.id" => memory_store_id},
            span_route: "/v1/memory_stores/{memory_store_id}/archive",
            method: :post,
            path: ["v1/memory_stores/%1$s/archive", memory_store_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "agent-memory-2026-07-22"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @memories = Anthropic::Resources::Beta::MemoryStores::Memories.new(client: client)
          @memory_versions = Anthropic::Resources::Beta::MemoryStores::MemoryVersions.new(client: client)
        end
      end
    end
  end
end
