# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        # @return [Anthropic::Resources::Beta::MemoryStores::Memories]
        attr_reader :memories

        # @return [Anthropic::Resources::Beta::MemoryStores::MemoryVersions]
        attr_reader :memory_versions

        # CreateMemoryStore
        #
        # @overload create(name:, description: nil, metadata: nil, betas: nil, request_options: {})
        #
        # @param name [String] Body param
        #
        # @param description [String] Body param
        #
        # @param metadata [Hash{Symbol=>String}] Body param
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::MemoryStoreCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/memory_stores?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # GetMemoryStore
        #
        # @overload retrieve(memory_store_id, betas: nil, request_options: {})
        #
        # @param memory_store_id [String] Path parameter memory_store_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreRetrieveParams
        def retrieve(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/memory_stores/%1$s?beta=true", memory_store_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::MemoryStoreUpdateParams} for more details.
        #
        # UpdateMemoryStore
        #
        # @overload update(memory_store_id, description: nil, metadata: nil, name: nil, betas: nil, request_options: {})
        #
        # @param memory_store_id [String] Path param: Path parameter memory_store_id
        #
        # @param description [String, nil] Body param
        #
        # @param metadata [Hash{Symbol=>String, nil}, nil] Body param: Metadata patch. Set a key to a string to upsert it, or to null to de
        #
        # @param name [String, nil] Body param
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreUpdateParams
        def update(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/memory_stores/%1$s?beta=true", memory_store_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # ListMemoryStores
        #
        # @overload list(created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
        #
        # @param created_at_gte [Time] Query param: Return stores created at or after this time (inclusive).
        #
        # @param created_at_lte [Time] Query param: Return stores created at or before this time (inclusive).
        #
        # @param include_archived [Boolean] Query param: Query parameter for include_archived
        #
        # @param limit [Integer] Query param: Query parameter for limit
        #
        # @param page [String] Query param: Query parameter for page
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
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
            method: :get,
            path: "v1/memory_stores?beta=true",
            query: query.transform_keys(created_at_gte: "created_at[gte]", created_at_lte: "created_at[lte]"),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # DeleteMemoryStore
        #
        # @overload delete(memory_store_id, betas: nil, request_options: {})
        #
        # @param memory_store_id [String] Path parameter memory_store_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreDeleteParams
        def delete(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/memory_stores/%1$s?beta=true", memory_store_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # ArchiveMemoryStore
        #
        # @overload archive(memory_store_id, betas: nil, request_options: {})
        #
        # @param memory_store_id [String] Path parameter memory_store_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMemoryStore]
        #
        # @see Anthropic::Models::Beta::MemoryStoreArchiveParams
        def archive(memory_store_id, params = {})
          parsed, options = Anthropic::Beta::MemoryStoreArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/memory_stores/%1$s/archive?beta=true", memory_store_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsMemoryStore,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
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
