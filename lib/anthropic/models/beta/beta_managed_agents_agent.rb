# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Agents#create
      class BetaManagedAgentsAgent < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute description
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute mcp_servers
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition>]
        required :mcp_servers,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition] }

        # @!attribute metadata
        #
        #   @return [Hash{Symbol=>String}]
        required :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute model
        #   Model identifier and configuration.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsModelConfig]
        required :model, -> { Anthropic::Beta::BetaManagedAgentsModelConfig }

        # @!attribute multiagent
        #   Resolved coordinator topology with a concrete agent roster.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagent, nil]
        required :multiagent, -> { Anthropic::Beta::BetaManagedAgentsMultiagent }, nil?: true

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute skills
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill>]
        required :skills,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsAgent::Skill] }

        # @!attribute system_
        #
        #   @return [String, nil]
        required :system_, String, api_name: :system, nil?: true

        # @!attribute tools
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool>]
        required :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsAgent::Tool] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgent::Type }

        # @!attribute updated_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute version
        #   The agent's current version. Starts at 1 and increments when the agent is
        #   modified.
        #
        #   @return [Integer]
        required :version, Integer

        # @!method initialize(id:, archived_at:, created_at:, description:, mcp_servers:, metadata:, model:, multiagent:, name:, skills:, system_:, tools:, type:, updated_at:, version:)
        #   A Managed Agents `agent`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgent} for more details.
        #
        #   @param id [String]
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param description [String, nil]
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition>]
        #
        #   @param metadata [Hash{Symbol=>String}]
        #
        #   @param model [Anthropic::Models::Beta::BetaManagedAgentsModelConfig] Model identifier and configuration.
        #
        #   @param multiagent [Anthropic::Models::Beta::BetaManagedAgentsMultiagent, nil] Resolved coordinator topology with a concrete agent roster.
        #
        #   @param name [String]
        #
        #   @param skills [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill>]
        #
        #   @param system_ [String, nil]
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool>]
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgent::Type]
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format
        #
        #   @param version [Integer] The agent's current version. Starts at 1 and increments when the agent is modifi

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

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :skill_id
          #
          #   @option args [String] :version
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill]
          def self.new(type:, **args)
            case type.to_sym
            when :anthropic
              Anthropic::Beta::BetaManagedAgentsAnthropicSkill.new(**args)
            when :custom
              Anthropic::Beta::BetaManagedAgentsCustomSkill.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
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

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsBashToolConfig, Anthropic::Models::Beta::BetaManagedAgentsEditToolConfig, Anthropic::Models::Beta::BetaManagedAgentsReadToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWriteToolConfig, Anthropic::Models::Beta::BetaManagedAgentsGlobToolConfig, Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfig, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfig>, Array<Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfig>] :configs
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsAgentToolsetDefaultConfig, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfig] :default_config Resolved default configuration for agent tools.
          #
          #   @option args [String] :mcp_server_name
          #
          #   @option args [String] :description
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema] :input_schema JSON Schema for custom tool input parameters.
          #
          #   @option args [String] :name
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool]
          def self.new(type:, **args)
            case type.to_sym
            when :agent_toolset_20260401
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401.new(**args)
            when :mcp_toolset
              Anthropic::Beta::BetaManagedAgentsMCPToolset.new(**args)
            when :custom
              Anthropic::Beta::BetaManagedAgentsCustomTool.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT = :agent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgent = Beta::BetaManagedAgentsAgent
  end
end
