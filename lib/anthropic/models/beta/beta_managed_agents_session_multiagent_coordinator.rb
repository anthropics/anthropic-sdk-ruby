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

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor)]
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
