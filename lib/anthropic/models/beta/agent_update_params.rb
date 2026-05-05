# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Agents#update
      class AgentUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute version
        #   The agent's current version, used to prevent concurrent overwrites. Obtain this
        #   value from a create or retrieve response. The request fails if this does not
        #   match the server's current version.
        #
        #   @return [Integer]
        required :version, Integer

        # @!attribute description
        #   Description. Up to 2048 characters. Omit to preserve; send empty string or null
        #   to clear.
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute mcp_servers
        #   MCP servers. Full replacement. Omit to preserve; send empty array or null to
        #   clear. Names must be unique. Maximum 20.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>, nil]
        optional :mcp_servers,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams]
                 },
                 nil?: true

        # @!attribute metadata
        #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        #   Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
        #   each) with values up to 512 chars.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute model
        #   Model identifier. Accepts the
        #   [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
        #   e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
        #   control. Omit to preserve. Cannot be cleared.
        #
        #   @return [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams, nil]
        optional :model, union: -> { Anthropic::Beta::AgentUpdateParams::Model }

        # @!attribute multiagent
        #   A coordinator topology: the session's primary thread orchestrates work by
        #   spawning session threads, each running an agent drawn from the `agents` roster.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams, nil]
        optional :multiagent, -> { Anthropic::Beta::BetaManagedAgentsMultiagentParams }, nil?: true

        # @!attribute name
        #   Human-readable name. 1-256 characters. Omit to preserve. Cannot be cleared.
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute skills
        #   Skills. Full replacement. Omit to preserve; send empty array or null to clear.
        #   Maximum 20.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>, nil]
        optional :skills,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSkillParams]
                 },
                 nil?: true

        # @!attribute system_
        #   System prompt. Up to 100,000 characters. Omit to preserve; send empty string or
        #   null to clear.
        #
        #   @return [String, nil]
        optional :system_, String, api_name: :system, nil?: true

        # @!attribute tools
        #   Tool configurations available to the agent. Full replacement. Omit to preserve;
        #   send empty array or null to clear. Maximum of 128 tools across all toolsets
        #   allowed.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>, nil]
        optional :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::AgentUpdateParams::Tool] },
                 nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(agent_id:, version:, description: nil, mcp_servers: nil, metadata: nil, model: nil, multiagent: nil, name: nil, skills: nil, system_: nil, tools: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::AgentUpdateParams} for more details.
        #
        #   @param agent_id [String]
        #
        #   @param version [Integer] The agent's current version, used to prevent concurrent overwrites. Obtain this
        #
        #   @param description [String, nil] Description. Up to 2048 characters. Omit to preserve; send empty string or null
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>, nil] MCP servers. Full replacement. Omit to preserve; send empty array or null to cle
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        #
        #   @param model [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams] Model identifier. Accepts the [model string](https://platform.claude.com/docs/en
        #
        #   @param multiagent [Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams, nil] A coordinator topology: the session's primary thread orchestrates work by spawni
        #
        #   @param name [String] Human-readable name. 1-256 characters. Omit to preserve. Cannot be cleared.
        #
        #   @param skills [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>, nil] Skills. Full replacement. Omit to preserve; send empty array or null to clear. M
        #
        #   @param system_ [String, nil] System prompt. Up to 100,000 characters. Omit to preserve; send empty string or
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>, nil] Tool configurations available to the agent. Full replacement. Omit to preserve;
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Model identifier. Accepts the
        # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
        # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
        # control. Omit to preserve. Cannot be cleared.
        module Model
          extend Anthropic::Internal::Type::Union

          # The model that will power your agent.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
          variant union: -> { Anthropic::Beta::BetaManagedAgentsModel }

          # An object that defines additional configuration control over model use
          variant -> { Anthropic::Beta::BetaManagedAgentsModelConfigParams }

          # @!method self.variants
          #   @return [Array(Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams)]
        end

        # Union type for tool configurations in the tools array.
        module Tool
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Configuration for built-in agent tools. Use this to enable or disable groups of tools available to the agent.
          variant :agent_toolset_20260401, -> { Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params }

          # Configuration for tools from an MCP server defined in `mcp_servers`.
          variant :mcp_toolset, -> { Anthropic::Beta::BetaManagedAgentsMCPToolsetParams }

          # A custom tool that is executed by the API client rather than the agent. When the agent calls this tool, an `agent.custom_tool_use` event is emitted and the session goes idle, waiting for the client to provide the result via a `user.custom_tool_result` event.
          variant :custom, -> { Anthropic::Beta::BetaManagedAgentsCustomToolParams }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams)]
        end
      end
    end
  end
end
