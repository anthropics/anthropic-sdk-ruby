# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionMultiagentCoordinator < Anthropic::Internal::Type::BaseModel
        # @!attribute agents
        #   Full `agent` definitions the coordinator may spawn as session threads.
        #
        #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadAgent>]
        required :agents,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type }

        # @!method initialize(agents:, type:)
        #   Resolved coordinator topology with full agent definitions for each roster
        #   member.
        #
        #   @param agents [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadAgent>] Full `agent` definitions the coordinator may spawn as session threads.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type]

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
