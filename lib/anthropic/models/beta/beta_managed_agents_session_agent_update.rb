# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionAgentUpdate < Anthropic::Internal::Type::BaseModel
        # @!attribute mcp_servers
        #   Replacement MCP server list. Full replacement: the provided array becomes the
        #   new value. Send an empty array to clear; omit to preserve.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>, nil]
        optional :mcp_servers,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams] }

        # @!attribute tools
        #   Replacement tool list. Full replacement: the provided array becomes the new
        #   value. Send an empty array to clear; omit to preserve.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>, nil]
        optional :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool] }

        # @!method initialize(mcp_servers: nil, tools: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionAgentUpdate} for more details.
        #
        #   Mid-session agent configuration update. Only `tools` and `mcp_servers` are
        #   updatable. Full replacement: the provided array becomes the new value. To
        #   preserve existing entries, GET the session, modify the array, and POST it back.
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams>] Replacement MCP server list. Full replacement: the provided array becomes the ne
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams>] Replacement tool list. Full replacement: the provided array becomes the new valu

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

    BetaManagedAgentsSessionAgentUpdate = Beta::BetaManagedAgentsSessionAgentUpdate
  end
end
