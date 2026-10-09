# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentWorkflowsEnabledParams =
      Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams

    module Beta
      class BetaManagedAgentsMultiagentWorkflowsEnabledParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Whether a run's plan can define inline agents. Defaults to enabled.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams,
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams
              )
            )
          )
        end
        attr_accessor :inline_agents

        # Predefined agents that a run's plan can use. At most 20. Defaults to null. Null
        # and an empty list both mean no predefined agents. This list is separate from
        # `subagents.predefined_agents`, and an agent in one list is not added to the
        # other.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentParams,
                  Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams,
                  String
                )
              ]
            )
          )
        end
        attr_accessor :predefined_agents

        # The agent can start workflow runs. Each run follows a plan, a program that the
        # agent writes. A plan can use predefined agents, which are the saved agents in
        # `predefined_agents`, and inline agents, which it defines itself and which are
        # not saved. If `inline_agents` is disabled, `predefined_agents` must name at
        # least one agent.
        sig do
          params(
            inline_agents:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams::OrHash
                )
              ),
            predefined_agents:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash,
                    Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::OrHash,
                    String
                  )
                ]
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether a run's plan can define inline agents. Defaults to enabled.
          inline_agents: nil,
          # Predefined agents that a run's plan can use. At most 20. Defaults to null. Null
          # and an empty list both mean no predefined agents. This list is separate from
          # `subagents.predefined_agents`, and an agent in one list is not added to the
          # other.
          predefined_agents: nil,
          type: :enabled
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              inline_agents:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams,
                    Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams
                  )
                ),
              predefined_agents:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaManagedAgentsAgentParams,
                      Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams,
                      String
                    )
                  ]
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
