# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Agents
        # @return [Anthropic::Resources::Beta::Agents::Versions]
        attr_reader :versions

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::AgentCreateParams} for more details.
        #
        # Create Agent
        #
        # @overload create(model:, name:, description: nil, mcp_servers: nil, metadata: nil, skills: nil, system_: nil, tools: nil, betas: nil, request_options: {})
        #
        # @param model [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams] Body param: Model identifier. Accepts the [model string](https://platform.claude
        #
        # @param name [String] Body param: Human-readable name for the agent. 1-256 characters.
        #
        # @param description [String, nil] Body param: Description of what the agent does. Up to 2048 characters.
        #
        # @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>] Body param: MCP servers this agent connects to. Maximum 20. Names must be unique
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars,
        #
        # @param skills [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>] Body param: Skills available to the agent. Maximum 20.
        #
        # @param system_ [String, nil] Body param: System prompt for the agent. Up to 100,000 characters.
        #
        # @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>] Body param: Tool configurations available to the agent. Maximum of 128 tools acr
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAgent]
        #
        # @see Anthropic::Models::Beta::AgentCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::AgentCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/agents?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsAgent,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::AgentRetrieveParams} for more details.
        #
        # Get Agent
        #
        # @overload retrieve(agent_id, version: nil, betas: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Path parameter agent_id
        #
        # @param version [Integer] Query param: Agent version. Omit for the most recent version. Must be at least 1
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAgent]
        #
        # @see Anthropic::Models::Beta::AgentRetrieveParams
        def retrieve(agent_id, params = {})
          query_params = [:version]
          parsed, options = Anthropic::Beta::AgentRetrieveParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: ["v1/agents/%1$s?beta=true", agent_id],
            query: query,
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsAgent,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::AgentUpdateParams} for more details.
        #
        # Update Agent
        #
        # @overload update(agent_id, version:, description: nil, mcp_servers: nil, metadata: nil, model: nil, name: nil, skills: nil, system_: nil, tools: nil, betas: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Path parameter agent_id
        #
        # @param version [Integer] Body param: The agent's current version, used to prevent concurrent overwrites.
        #
        # @param description [String, nil] Body param: Description. Up to 2048 characters. Omit to preserve; send empty str
        #
        # @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>, nil] Body param: MCP servers. Full replacement. Omit to preserve; send empty array or
        #
        # @param metadata [Hash{Symbol=>String, nil}, nil] Body param: Metadata patch. Set a key to a string to upsert it, or to null to de
        #
        # @param model [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams] Body param: Model identifier. Accepts the [model string](https://platform.claude
        #
        # @param name [String] Body param: Human-readable name. 1-256 characters. Omit to preserve. Cannot be c
        #
        # @param skills [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>, nil] Body param: Skills. Full replacement. Omit to preserve; send empty array or null
        #
        # @param system_ [String, nil] Body param: System prompt. Up to 100,000 characters. Omit to preserve; send empt
        #
        # @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>, nil] Body param: Tool configurations available to the agent. Full replacement. Omit t
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAgent]
        #
        # @see Anthropic::Models::Beta::AgentUpdateParams
        def update(agent_id, params)
          parsed, options = Anthropic::Beta::AgentUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/agents/%1$s?beta=true", agent_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsAgent,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # List Agents
        #
        # @overload list(created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
        #
        # @param created_at_gte [Time] Query param: Return agents created at or after this time (inclusive).
        #
        # @param created_at_lte [Time] Query param: Return agents created at or before this time (inclusive).
        #
        # @param include_archived [Boolean] Query param: Include archived agents in results. Defaults to false.
        #
        # @param limit [Integer] Query param: Maximum results per page. Default 20, maximum 100.
        #
        # @param page [String] Query param: Opaque pagination cursor from a previous response.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaManagedAgentsAgent>]
        #
        # @see Anthropic::Models::Beta::AgentListParams
        def list(params = {})
          query_params = [:created_at_gte, :created_at_lte, :include_archived, :limit, :page]
          parsed, options = Anthropic::Beta::AgentListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/agents?beta=true",
            query: query.transform_keys(created_at_gte: "created_at[gte]", created_at_lte: "created_at[lte]"),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaManagedAgentsAgent,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Archive Agent
        #
        # @overload archive(agent_id, betas: nil, request_options: {})
        #
        # @param agent_id [String] Path parameter agent_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAgent]
        #
        # @see Anthropic::Models::Beta::AgentArchiveParams
        def archive(agent_id, params = {})
          parsed, options = Anthropic::Beta::AgentArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/agents/%1$s/archive?beta=true", agent_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsAgent,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @versions = Anthropic::Resources::Beta::Agents::Versions.new(client: client)
        end
      end
    end
  end
end
