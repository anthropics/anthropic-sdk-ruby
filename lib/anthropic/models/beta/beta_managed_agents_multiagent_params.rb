# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentParams < Anthropic::Internal::Type::BaseModel
        # @!attribute agents
        #   Agents the coordinator may spawn as session threads. 1–20 entries. Each entry is
        #   an agent ID string, a versioned `{"type":"agent","id","version"}` reference, or
        #   `{"type":"self"}` to allow recursive self-invocation. Entries must reference
        #   distinct agents (after resolving `self` and string forms); at most one `self`.
        #   Referenced agents must exist, must not be archived, and must not themselves have
        #   `multiagent` set (depth limit 1).
        #
        #   @return [Array<String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams>]
        required :agents,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsMultiagentRosterEntryParams] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMultiagentParams::Type }

        # @!method initialize(agents:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams} for more details.
        #
        #   A coordinator topology: the session's primary thread orchestrates work by
        #   spawning session threads, each running an agent drawn from the `agents` roster.
        #
        #   @param agents [Array<String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams>] Agents the coordinator may spawn as session threads. 1–20 entries. Each entry is
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATOR = :coordinator

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMultiagentParams = Beta::BetaManagedAgentsMultiagentParams
  end
end
