# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionMultiagentCoordinator < Anthropic::Internal::Type::BaseModel
        # @!attribute agents
        #   Full `agent` definitions the coordinator may spawn as session threads.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor>]
        required :agents,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type }

        # @!method initialize(agents:, type:)
        #   Resolved coordinator topology with full agent definitions for each roster
        #   member.
        #
        #   @param agents [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor>] Full `agent` definitions the coordinator may spawn as session threads.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type]

        # A session-resolved multiagent roster entry.
        module Agent
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Resolved `agent` definition for a single `session_thread`. Snapshot of the agent at thread creation time. The multiagent roster is not repeated here; read it from `Session.agent`.
          variant :agent, -> { Anthropic::Beta::BetaManagedAgentsSessionThreadAgent }

          # Platform advisor roster entry: a model the session's primary thread may consult mid-turn.
          variant :advisor, -> { Anthropic::Beta::BetaManagedAgentsAdvisor }

          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT = :agent
            ADVISOR = :advisor

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :id
          #
          #   @option args [String, nil] :description
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition>] :mcp_servers
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsModelConfig, String] :model Model identifier and configuration.
          #
          #   @option args [String] :name
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill>] :skills
          #
          #   @option args [String, nil] :system_
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool>] :tools
          #
          #   @option args [Integer] :version
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor]
          def self.new(type:, **args)
            case type.to_sym
            when :agent
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent.new(**args)
            when :advisor
              Anthropic::Beta::BetaManagedAgentsAdvisor.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator#type
        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATOR = :coordinator

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionMultiagentCoordinator = Beta::BetaManagedAgentsSessionMultiagentCoordinator
  end
end
