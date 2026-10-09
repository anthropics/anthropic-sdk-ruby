# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionMultiagentSubagentsEnabled =
      Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled

    module Beta
      class BetaManagedAgentsSessionMultiagentSubagentsEnabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the agent can define inline agents, which are not saved, when it spawns
        # session threads.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgents::Variants
          )
        end
        attr_accessor :inline_agents

        # Full `agent` definitions of the predefined agents, which are saved agents that
        # this agent can spawn as session threads.
        sig do
          returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsSessionThreadAgent]
          )
        end
        attr_accessor :predefined_agents

        sig { returns(Symbol) }
        attr_accessor :type

        # The agent can spawn session threads.
        sig do
          params(
            inline_agents:
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled::OrHash
              ),
            predefined_agents:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::OrHash
              ],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the agent can define inline agents, which are not saved, when it spawns
          # session threads.
          inline_agents:,
          # Full `agent` definitions of the predefined agents, which are saved agents that
          # this agent can spawn as session threads.
          predefined_agents:,
          type: :enabled
        )
        end

        sig do
          override.returns(
            {
              inline_agents:
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgents::Variants,
              predefined_agents:
                T::Array[Anthropic::Beta::BetaManagedAgentsSessionThreadAgent],
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
