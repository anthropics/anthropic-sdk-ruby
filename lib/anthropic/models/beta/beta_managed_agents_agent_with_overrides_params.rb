# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentWithOverridesParams < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The `agent` ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Type }

        # @!attribute mcp_servers
        #   Replacement MCP server list. Full replacement: the provided array becomes the
        #   MCP servers. Send an empty array to clear; omit to preserve the agent's servers.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>, nil]
        optional :mcp_servers,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams] }

        # @!attribute model
        #   Replacement model. Accepts the model string, e.g. `claude-opus-4-6`, or a
        #   `model_config` object. Omit to use the agent's model.
        #
        #   @return [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams, nil]
        optional :model, union: -> { Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Model }

        # @!attribute skills
        #   Replacement skill list. Full replacement: the provided array becomes the skills.
        #   Send an empty array to clear; omit to preserve the agent's skills.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>, nil]
        optional :skills,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSkillParams] }

        # @!attribute system_
        #   Replacement system prompt. Up to 100,000 characters. Set to null to clear the
        #   agent's system prompt; omit to preserve it.
        #
        #   @return [String, nil]
        optional :system_, String, api_name: :system, nil?: true

        # @!attribute tools
        #   Replacement tool list. Full replacement: the provided array becomes the tool
        #   configuration. Send an empty array to clear; omit to preserve the agent's tools.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>, nil]
        optional :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Tool] }

        # @!attribute version
        #   The specific `agent` version to use. Omit to use the latest version.
        #
        #   @return [Integer, nil]
        optional :version, Integer

        # @!method initialize(id:, type:, mcp_servers: nil, model: nil, skills: nil, system_: nil, tools: nil, version: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams} for more
        #   details.
        #
        #   Reference to an `agent` plus optional configuration overrides. Each provided
        #   field replaces the agent's value for the caller's use; the agent resource is
        #   unchanged.
        #
        #   @param id [String] The `agent` ID.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams::Type]
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>] Replacement MCP server list. Full replacement: the provided array becomes the MC
        #
        #   @param model [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams] Replacement model. Accepts the model string, e.g. `claude-opus-4-6`, or a `model
        #
        #   @param skills [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams>] Replacement skill list. Full replacement: the provided array becomes the skills.
        #
        #   @param system_ [String, nil] Replacement system prompt. Up to 100,000 characters. Set to null to clear the ag
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>] Replacement tool list. Full replacement: the provided array becomes the tool con
        #
        #   @param version [Integer] The specific `agent` version to use. Omit to use the latest version.

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT_WITH_OVERRIDES = :agent_with_overrides

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Replacement model. Accepts the model string, e.g. `claude-opus-4-6`, or a
        # `model_config` object. Omit to use the agent's model.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams#model
        module Model
          extend Anthropic::Internal::Type::Union

          # The model that will power your agent.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
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

    BetaManagedAgentsAgentWithOverridesParams = Beta::BetaManagedAgentsAgentWithOverridesParams
  end
end
