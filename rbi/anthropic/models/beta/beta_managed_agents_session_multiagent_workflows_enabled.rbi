# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionMultiagentWorkflowsEnabled =
      Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled

    module Beta
      class BetaManagedAgentsSessionMultiagentWorkflowsEnabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether a run's plan can define inline agents, which are not saved.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgents::Variants
          )
        end
        attr_accessor :inline_agents

        # Full `agent` definitions of the predefined agents, which are saved agents that a
        # run's plan can use.
        sig do
          returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsSessionThreadAgent]
          )
        end
        attr_accessor :predefined_agents

        sig { returns(Symbol) }
        attr_accessor :type

        # The agent can start workflow runs.
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
          # Whether a run's plan can define inline agents, which are not saved.
          inline_agents:,
          # Full `agent` definitions of the predefined agents, which are saved agents that a
          # run's plan can use.
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
