# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentCoordinator < Anthropic::Internal::Type::BaseModel
        # @!attribute agents
        #   Agents the coordinator may spawn as session threads, each resolved to a specific
        #   version.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentReference>]
        required :agents,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsAgentReference] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinator::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Type }

        # @!method initialize(agents:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinator} for more
        #   details.
        #
        #   Resolved coordinator topology with a concrete agent roster.
        #
        #   @param agents [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentReference>] Agents the coordinator may spawn as session threads, each resolved to a specific
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinator::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinator#type
        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATOR = :coordinator

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMultiagentCoordinator = Beta::BetaManagedAgentsMultiagentCoordinator
  end
end
