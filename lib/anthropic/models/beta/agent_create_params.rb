# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Agents#create
      class AgentCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute model
        #   Model identifier. Accepts the
        #   [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
        #   e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
        #   control
        #
        #   @return [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams]
        required :model, union: -> { Anthropic::Beta::AgentCreateParams::Model }

        # @!attribute name
        #   Human-readable name for the agent. 1-256 characters.
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #   Description of what the agent does. Up to 2048 characters.
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute mcp_servers
        #   MCP servers this agent connects to. Maximum 20. Names must be unique within the
        #   array.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>, nil]
        optional :mcp_servers,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams] }

        # @!attribute metadata
        #   Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        #   to 512 chars.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute multiagent
        #   A coordinator topology: the session's primary thread orchestrates work by
        #   spawning session threads, each running an agent drawn from the `agents` roster.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams, nil]
        optional :multiagent, -> { Anthropic::Beta::BetaManagedAgentsMultiagentParams }, nil?: true

        # @!attribute skills
        #   Skills available to the agent. Maximum 20.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>, nil]
        optional :skills,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSkillParams] }

        # @!attribute system_
        #   System prompt for the agent. Up to 100,000 characters.
        #
        #   @return [String, nil]
        optional :system_, String, api_name: :system, nil?: true

        # @!attribute tools
        #   Tool configurations available to the agent. Maximum of 128 tools across all
        #   toolsets allowed.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>, nil]
        optional :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::AgentCreateParams::Tool] }

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(model:, name:, description: nil, mcp_servers: nil, metadata: nil, multiagent: nil, skills: nil, system_: nil, tools: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::AgentCreateParams} for more details.
        #
        #   @param model [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams] Model identifier. Accepts the [model string](https://platform.claude.com/docs/en
        #
        #   @param name [String] Human-readable name for the agent. 1-256 characters.
        #
        #   @param description [String, nil] Description of what the agent does. Up to 2048 characters.
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>] MCP servers this agent connects to. Maximum 20. Names must be unique within the
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up t
        #
        #   @param multiagent [Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams, nil] A coordinator topology: the session's primary thread orchestrates work by spawni
        #
        #   @param skills [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>] Skills available to the agent. Maximum 20.
        #
        #   @param system_ [String, nil] System prompt for the agent. Up to 100,000 characters.
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>] Tool configurations available to the agent. Maximum of 128 tools across all tool
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Model identifier. Accepts the
        # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
        # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
        # control
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
