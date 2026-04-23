# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class Memories
          # CreateMemory
          #
          # @overload create(memory_store_id, content:, path:, view: nil, betas: nil, request_options: {})
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param content [String, nil] Body param
          #
          # @param path [String] Body param
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Query parameter for view
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryCreateParams
          def create(memory_store_id, params)
            query_params = [:view]
            header_params = {betas: "anthropic-beta"}
            parsed, options = Anthropic::Beta::MemoryStores::MemoryCreateParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :post,
              path: ["v1/memory_stores/%1$s/memories?beta=true", memory_store_id],
              query: query,
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*query_params, *header_params.keys),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # GetMemory
          #
          # @overload retrieve(memory_id, memory_store_id:, view: nil, betas: nil, request_options: {})
          #
          # @param memory_id [String] Path param: Path parameter memory_id
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Query parameter for view
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
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
              method: :get,
              path: ["v1/memory_stores/%1$s/memories/%2$s?beta=true", memory_store_id, memory_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # UpdateMemory
          #
          # @overload update(memory_id, memory_store_id:, view: nil, content: nil, path: nil, precondition: nil, betas: nil, request_options: {})
          #
          # @param memory_id [String] Path param: Path parameter memory_id
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Query parameter for view
          #
          # @param content [String, nil] Body param
          #
          # @param path [String, nil] Body param
          #
          # @param precondition [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition] Body param
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryUpdateParams
          def update(memory_id, params)
            query_params = [:view]
            header_params = {betas: "anthropic-beta"}
            parsed, options = Anthropic::Beta::MemoryStores::MemoryUpdateParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            memory_store_id =
              parsed.delete(:memory_store_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/memory_stores/%1$s/memories/%2$s?beta=true", memory_store_id, memory_id],
              query: query,
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*query_params, *header_params.keys),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::MemoryListParams} for more details.
          #
          # ListMemories
          #
          # @overload list(memory_store_id, depth: nil, limit: nil, order: nil, order_by: nil, page: nil, path_prefix: nil, view: nil, betas: nil, request_options: {})
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param depth [Integer] Query param: Query parameter for depth
          #
          # @param limit [Integer] Query param: Query parameter for limit
          #
          # @param order [Symbol, Anthropic::Models::Beta::MemoryStores::MemoryListParams::Order] Query param: Query parameter for order
          #
          # @param order_by [String] Query param: Query parameter for order_by
          #
          # @param page [String] Query param: Query parameter for page
          #
          # @param path_prefix [String] Query param: Optional path prefix filter (raw string-prefix match; include a tra
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Query parameter for view
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix>]
          #
          # @see Anthropic::Models::Beta::MemoryStores::MemoryListParams
          def list(memory_store_id, params = {})
            query_params = [:depth, :limit, :order, :order_by, :page, :path_prefix, :view]
            parsed, options = Anthropic::Beta::MemoryStores::MemoryListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/memory_stores/%1$s/memories?beta=true", memory_store_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # DeleteMemory
          #
          # @overload delete(memory_id, memory_store_id:, expected_content_sha256: nil, betas: nil, request_options: {})
          #
          # @param memory_id [String] Path param: Path parameter memory_id
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param expected_content_sha256 [String] Query param: Query parameter for expected_content_sha256
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
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
              method: :delete,
              path: ["v1/memory_stores/%1$s/memories/%2$s?beta=true", memory_store_id, memory_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory,
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
