# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagent < Anthropic::Internal::Type::BaseModel
        # @!attribute agents
        #   Agents the coordinator may spawn as session threads, each resolved to a specific
        #   version.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentReference, Anthropic::Models::Beta::BetaManagedAgentsAdvisor>]
        required :agents,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsMultiagent::Agent] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMultiagent::Type }

        # @!method initialize(agents:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMultiagent} for more details.
        #
        #   Resolved coordinator topology with a concrete agent roster.
        #
        #   @param agents [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentReference, Anthropic::Models::Beta::BetaManagedAgentsAdvisor>] Agents the coordinator may spawn as session threads, each resolved to a specific
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagent::Type]

        # A resolved multiagent roster entry.
        module Agent
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # A resolved agent reference with a concrete version.
          variant :agent, -> { Anthropic::Beta::BetaManagedAgentsAgentReference }

          # Platform advisor roster entry: a model the session's primary thread may consult mid-turn.
          variant :advisor, -> { Anthropic::Beta::BetaManagedAgentsAdvisor }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAgentReference, Anthropic::Models::Beta::BetaManagedAgentsAdvisor)]
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsMultiagent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATOR = :coordinator

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMultiagent = Beta::BetaManagedAgentsMultiagent
  end
end
