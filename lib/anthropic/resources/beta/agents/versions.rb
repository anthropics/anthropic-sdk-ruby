# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Agents
        class Versions
          # List Agent Versions
          #
          # @overload list(agent_id, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param agent_id [String] Path param: Path parameter agent_id
          #
          # @param limit [Integer] Query param: Maximum results per page. Default 20, maximum 100.
          #
          # @param page [String] Query param: Opaque pagination cursor.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaManagedAgentsAgent>]
          #
          # @see Anthropic::Models::Beta::Agents::VersionListParams
          def list(agent_id, params = {})
            query_params = [:limit, :page]
            parsed, options = Anthropic::Beta::Agents::VersionListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/agents/%1$s/versions?beta=true", agent_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::BetaManagedAgentsAgent,
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
