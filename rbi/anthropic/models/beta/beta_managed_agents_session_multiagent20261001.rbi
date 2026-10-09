# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionMultiagent20261001 =
      Beta::BetaManagedAgentsSessionMultiagent20261001

    module Beta
      class BetaManagedAgentsSessionMultiagent20261001 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionMultiagent20261001,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the session's primary thread can consult an advisor model.
        sig do
          returns(Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Variants)
        end
        attr_accessor :advisor

        # Whether the agent can spawn session threads.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Variants
          )
        end
        attr_accessor :subagents

        sig { returns(Symbol) }
        attr_accessor :type

        # Whether the agent can start workflow runs.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionMultiagentWorkflows::Variants
          )
        end
        attr_accessor :workflows

        # Resolved multiagent configuration with three members, as copied to the `session`
        # at creation.
        sig do
          params(
            advisor:
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabled::OrHash
              ),
            subagents:
              T.any(
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled::OrHash
              ),
            workflows:
              T.any(
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the session's primary thread can consult an advisor model.
          advisor:,
          # Whether the agent can spawn session threads.
          subagents:,
          # Whether the agent can start workflow runs.
          workflows:,
          type: :multiagent_20261001
        )
        end

        sig do
          override.returns(
            {
              advisor:
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Variants,
              subagents:
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Variants,
              type: Symbol,
              workflows:
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentWorkflows::Variants
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
