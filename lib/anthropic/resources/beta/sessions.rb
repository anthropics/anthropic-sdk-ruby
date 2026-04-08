# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Sessions
        # @return [Anthropic::Resources::Beta::Sessions::Events]
        attr_reader :events

        # @return [Anthropic::Resources::Beta::Sessions::Resources]
        attr_reader :resources

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::SessionCreateParams} for more details.
        #
        # Create Session
        #
        # @overload create(agent:, environment_id:, metadata: nil, resources: nil, title: nil, vault_ids: nil, betas: nil, request_options: {})
        #
        # @param agent [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams] Body param: Agent identifier. Accepts the `agent` ID string, which pins the late
        #
        # @param environment_id [String] Body param: ID of the `environment` defining the container configuration for thi
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Arbitrary key-value metadata attached to the session. Maximum 16 pai
        #
        # @param resources [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams>] Body param: Resources (e.g. repositories, files) to mount into the session's con
        #
        # @param title [String, nil] Body param: Human-readable session title.
        #
        # @param vault_ids [Array<String>] Body param: Vault IDs for stored credentials the agent can use during the sessio
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsSession]
        #
        # @see Anthropic::Models::Beta::SessionCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::SessionCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/sessions?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsSession,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Get Session
        #
        # @overload retrieve(session_id, betas: nil, request_options: {})
        #
        # @param session_id [String] Path parameter session_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsSession]
        #
        # @see Anthropic::Models::Beta::SessionRetrieveParams
        def retrieve(session_id, params = {})
          parsed, options = Anthropic::Beta::SessionRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/sessions/%1$s?beta=true", session_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsSession,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::SessionUpdateParams} for more details.
        #
        # Update Session
        #
        # @overload update(session_id, metadata: nil, title: nil, vault_ids: nil, betas: nil, request_options: {})
        #
        # @param session_id [String] Path param: Path parameter session_id
        #
        # @param metadata [Hash{Symbol=>String, nil}, nil] Body param: Metadata patch. Set a key to a string to upsert it, or to null to de
        #
        # @param title [String, nil] Body param: Human-readable session title.
        #
        # @param vault_ids [Array<String>] Body param: Vault IDs (`vlt_*`) to attach to the session. Not yet supported; req
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsSession]
        #
        # @see Anthropic::Models::Beta::SessionUpdateParams
        def update(session_id, params = {})
          parsed, options = Anthropic::Beta::SessionUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/sessions/%1$s?beta=true", session_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsSession,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::SessionListParams} for more details.
        #
        # List Sessions
        #
        # @overload list(agent_id: nil, agent_version: nil, created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, include_archived: nil, limit: nil, order: nil, page: nil, betas: nil, request_options: {})
        #
        # @param agent_id [String] Query param: Filter sessions created with this agent ID.
        #
        # @param agent_version [Integer] Query param: Filter by agent version. Only applies when agent_id is also set.
        #
        # @param created_at_gt [Time] Query param: Return sessions created after this time (exclusive).
        #
        # @param created_at_gte [Time] Query param: Return sessions created at or after this time (inclusive).
        #
        # @param created_at_lt [Time] Query param: Return sessions created before this time (exclusive).
        #
        # @param created_at_lte [Time] Query param: Return sessions created at or before this time (inclusive).
        #
        # @param include_archived [Boolean] Query param: When true, includes archived sessions. Default: false (exclude arch
        #
        # @param limit [Integer] Query param: Maximum number of results to return.
        #
        # @param order [Symbol, Anthropic::Models::Beta::SessionListParams::Order] Query param: Sort direction for results, ordered by created_at. Defaults to desc
        #
        # @param page [String] Query param: Opaque pagination cursor from a previous response's next_page.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaManagedAgentsSession>]
        #
        # @see Anthropic::Models::Beta::SessionListParams
        def list(params = {})
          query_params =
            [
              :agent_id,
              :agent_version,
              :created_at_gt,
              :created_at_gte,
              :created_at_lt,
              :created_at_lte,
              :include_archived,
              :limit,
              :order,
              :page
            ]
          parsed, options = Anthropic::Beta::SessionListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/sessions?beta=true",
            query: query.transform_keys(
              created_at_gt: "created_at[gt]",
              created_at_gte: "created_at[gte]",
              created_at_lt: "created_at[lt]",
              created_at_lte: "created_at[lte]"
            ),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaManagedAgentsSession,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Delete Session
        #
        # @overload delete(session_id, betas: nil, request_options: {})
        #
        # @param session_id [String] Path parameter session_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeletedSession]
        #
        # @see Anthropic::Models::Beta::SessionDeleteParams
        def delete(session_id, params = {})
          parsed, options = Anthropic::Beta::SessionDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/sessions/%1$s?beta=true", session_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeletedSession,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Archive Session
        #
        # @overload archive(session_id, betas: nil, request_options: {})
        #
        # @param session_id [String] Path parameter session_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsSession]
        #
        # @see Anthropic::Models::Beta::SessionArchiveParams
        def archive(session_id, params = {})
          parsed, options = Anthropic::Beta::SessionArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/sessions/%1$s/archive?beta=true", session_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsSession,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @events = Anthropic::Resources::Beta::Sessions::Events.new(client: client)
          @resources = Anthropic::Resources::Beta::Sessions::Resources.new(client: client)
        end
      end
    end
  end
end
