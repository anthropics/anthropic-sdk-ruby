# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionAgent < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute description
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute mcp_servers
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition>]
        required :mcp_servers,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition] }

        # @!attribute model
        #   Model identifier and configuration.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsModelConfig]
        required :model, -> { Anthropic::Beta::BetaManagedAgentsModelConfig }

        # @!attribute multiagent
        #   Resolved coordinator topology with full agent definitions for each roster
        #   member.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator, nil]
        required :multiagent,
                 -> {
                   Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator
                 },
                 nil?: true

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute skills
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill>]
        required :skills,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionAgent::Skill] }

        # @!attribute system_
        #
        #   @return [String, nil]
        required :system_, String, api_name: :system, nil?: true

        # @!attribute tools
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool>]
        required :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionAgent::Tool] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionAgent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionAgent::Type }

        # @!attribute version
        #
        #   @return [Integer]
        required :version, Integer

        # @!method initialize(id:, description:, mcp_servers:, model:, multiagent:, name:, skills:, system_:, tools:, type:, version:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionAgent} for more details.
        #
        #   Resolved `agent` definition for a `session`. Snapshot of the `agent` at
        #   `session` creation time.
        #
        #   @param id [String]
        #
        #   @param description [String, nil]
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition>]
        #
        #   @param model [Anthropic::Models::Beta::BetaManagedAgentsModelConfig] Model identifier and configuration.
        #
        #   @param multiagent [Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator, nil] Resolved coordinator topology with full agent definitions for each roster member
        #
        #   @param name [String]
        #
        #   @param skills [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill>]
        #
        #   @param system_ [String, nil]
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool>]
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionAgent::Type]
        #
        #   @param version [Integer]

        # Resolved skill as returned in API responses.
        module Skill
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # A resolved Anthropic-managed skill.
          variant :anthropic, -> { Anthropic::Beta::BetaManagedAgentsAnthropicSkill }

          # A resolved user-created custom skill.
          variant :custom, -> { Anthropic::Beta::BetaManagedAgentsCustomSkill }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill)]
        end

        # Union type for tool configurations returned in API responses.
        module Tool
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :agent_toolset_20260401, -> { Anthropic::Beta::BetaManagedAgentsAgentToolset20260401 }

          variant :mcp_toolset, -> { Anthropic::Beta::BetaManagedAgentsMCPToolset }

          # A custom tool as returned in API responses.
          variant :custom, -> { Anthropic::Beta::BetaManagedAgentsCustomTool }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool)]
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionAgent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT = :agent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionAgent = Beta::BetaManagedAgentsSessionAgent
  end
end
