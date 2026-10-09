# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentWorkflowsEnabled =
      Beta::BetaManagedAgentsMultiagentWorkflowsEnabled

    module Beta
      class BetaManagedAgentsMultiagentWorkflowsEnabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabled,
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

        # Predefined agents, which are saved agents that a run's plan can use, each
        # resolved to a specific version.
        sig do
          returns(T::Array[Anthropic::Beta::BetaManagedAgentsAgentReference])
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
                Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash
              ],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether a run's plan can define inline agents, which are not saved.
          inline_agents:,
          # Predefined agents, which are saved agents that a run's plan can use, each
          # resolved to a specific version.
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
                T::Array[Anthropic::Beta::BetaManagedAgentsAgentReference],
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
