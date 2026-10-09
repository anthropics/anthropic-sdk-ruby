# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentSubagentsEnabledParams =
      Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams

    module Beta
      class BetaManagedAgentsMultiagentSubagentsEnabledParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Whether the agent can define inline agents when it spawns session threads.
        # Defaults to enabled.
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

        # Predefined agents that this agent can spawn as session threads. At most 20.
        # Defaults to null. Null and an empty list both mean no predefined agents. This
        # list is separate from `workflows.predefined_agents`, and an agent in one list is
        # not added to the other.
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

        # The agent can spawn session threads. Each thread runs a predefined agent, which
        # is a saved agent in `predefined_agents`, or an inline agent, which the agent
        # defines when it spawns the thread and which is not saved. If `inline_agents` is
        # disabled, `predefined_agents` must name at least one agent.
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
          # Whether the agent can define inline agents when it spawns session threads.
          # Defaults to enabled.
          inline_agents: nil,
          # Predefined agents that this agent can spawn as session threads. At most 20.
          # Defaults to null. Null and an empty list both mean no predefined agents. This
          # list is separate from `workflows.predefined_agents`, and an agent in one list is
          # not added to the other.
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
