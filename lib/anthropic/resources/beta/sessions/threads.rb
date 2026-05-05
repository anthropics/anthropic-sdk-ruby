# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Threads
          # @return [Anthropic::Resources::Beta::Sessions::Threads::Events]
          attr_reader :events

          # Get Session Thread
          #
          # @overload retrieve(thread_id, session_id:, betas: nil, request_options: {})
          #
          # @param thread_id [String] Path param: Path parameter thread_id
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread]
          #
          # @see Anthropic::Models::Beta::Sessions::ThreadRetrieveParams
          def retrieve(thread_id, params)
            parsed, options = Anthropic::Beta::Sessions::ThreadRetrieveParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/sessions/%1$s/threads/%2$s?beta=true", session_id, thread_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ThreadListParams} for more details.
          #
          # List Session Threads
          #
          # @overload list(session_id, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param limit [Integer] Query param: Maximum results per page. Defaults to 1000.
          #
          # @param page [String] Query param: Opaque pagination cursor from a previous response's next_page. Forw
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread>]
          #
          # @see Anthropic::Models::Beta::Sessions::ThreadListParams
          def list(session_id, params = {})
            query_params = [:limit, :page]
            parsed, options = Anthropic::Beta::Sessions::ThreadListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/sessions/%1$s/threads?beta=true", session_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Archive Session Thread
          #
          # @overload archive(thread_id, session_id:, betas: nil, request_options: {})
          #
          # @param thread_id [String] Path param: Path parameter thread_id
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread]
          #
          # @see Anthropic::Models::Beta::Sessions::ThreadArchiveParams
          def archive(thread_id, params)
            parsed, options = Anthropic::Beta::Sessions::ThreadArchiveParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/sessions/%1$s/threads/%2$s/archive?beta=true", session_id, thread_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @events = Anthropic::Resources::Beta::Sessions::Threads::Events.new(client: client)
          end
        end
      end
    end
  end
end
