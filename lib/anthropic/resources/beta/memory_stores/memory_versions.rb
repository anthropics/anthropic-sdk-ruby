# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class MemoryVersions
          # GetMemoryVersion
          #
          # @overload retrieve(memory_version_id, memory_store_id:, view: nil, betas: nil, request_options: {})
          #
          # @param memory_version_id [String] Path param: Path parameter memory_version_id
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Query parameter for view
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
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
              method: :get,
              path: [
                "v1/memory_stores/%1$s/memory_versions/%2$s?beta=true",
                memory_store_id,
                memory_version_id
              ],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # ListMemoryVersions
          #
          # @overload list(memory_store_id, api_key_id: nil, created_at_gte: nil, created_at_lte: nil, limit: nil, memory_id: nil, operation: nil, page: nil, session_id: nil, view: nil, betas: nil, request_options: {})
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param api_key_id [String] Query param: Query parameter for api_key_id
          #
          # @param created_at_gte [Time] Query param: Return versions created at or after this time (inclusive).
          #
          # @param created_at_lte [Time] Query param: Return versions created at or before this time (inclusive).
          #
          # @param limit [Integer] Query param: Query parameter for limit
          #
          # @param memory_id [String] Query param: Query parameter for memory_id
          #
          # @param operation [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation] Query param: Query parameter for operation
          #
          # @param page [String] Query param: Query parameter for page
          #
          # @param session_id [String] Query param: Query parameter for session_id
          #
          # @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query param: Query parameter for view
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
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
                :session_id,
                :view
              ]
            parsed, options = Anthropic::Beta::MemoryStores::MemoryVersionListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/memory_stores/%1$s/memory_versions?beta=true", memory_store_id],
              query: query.transform_keys(
                created_at_gte: "created_at[gte]",
                created_at_lte: "created_at[lte]"
              ),
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # RedactMemoryVersion
          #
          # @overload redact(memory_version_id, memory_store_id:, betas: nil, request_options: {})
          #
          # @param memory_version_id [String] Path param: Path parameter memory_version_id
          #
          # @param memory_store_id [String] Path param: Path parameter memory_store_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
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
              method: :post,
              path: [
                "v1/memory_stores/%1$s/memory_versions/%2$s/redact?beta=true",
                memory_store_id,
                memory_version_id
              ],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
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
