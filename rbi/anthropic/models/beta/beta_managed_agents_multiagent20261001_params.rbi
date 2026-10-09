# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagent20261001Params =
      Beta::BetaManagedAgentsMultiagent20261001Params

    module Beta
      class BetaManagedAgentsMultiagent20261001Params < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagent20261001Params,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Whether the session's primary thread can consult an advisor model. Defaults to
        # disabled.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams,
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams
              )
            )
          )
        end
        attr_accessor :advisor

        # Whether the agent can spawn session threads. Defaults to enabled.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams,
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams
              )
            )
          )
        end
        attr_accessor :subagents

        # Whether the agent can start workflow runs. Defaults to enabled.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams,
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams
              )
            )
          )
        end
        attr_accessor :workflows

        # Multiagent configuration with three members, each enabled or disabled on its
        # own. On an update, if the agent's stored `multiagent` also has type
        # `multiagent_20261001`, this configuration is merged into the stored one, level
        # by level, instead of replacing it. A key that the update omits keeps its stored
        # value. A key sent as null takes its default, on create as well, so
        # `"workflows": null` enables workflows. An object sent with a `type` other than
        # the stored one replaces the stored object, and the keys that it omits take their
        # defaults. A `predefined_agents` list that is sent replaces the stored list.
        # Every object that is sent needs its `type`, and an enabled `advisor` needs its
        # `model`. Other validation applies to the merged result.
        sig do
          params(
            advisor:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams::OrHash
                )
              ),
            subagents:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams::OrHash
                )
              ),
            workflows:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams::OrHash
                )
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the session's primary thread can consult an advisor model. Defaults to
          # disabled.
          advisor: nil,
          # Whether the agent can spawn session threads. Defaults to enabled.
          subagents: nil,
          # Whether the agent can start workflow runs. Defaults to enabled.
          workflows: nil,
          type: :multiagent_20261001
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              advisor:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams,
                    Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams
                  )
                ),
              subagents:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams,
                    Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams
                  )
                ),
              workflows:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams,
                    Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams
                  )
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
