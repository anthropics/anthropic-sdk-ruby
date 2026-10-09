# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionMultiagent =
      Beta::BetaManagedAgentsSessionMultiagent

    module Beta
      # Resolved multiagent orchestration configuration as returned on a `session`.
      module BetaManagedAgentsSessionMultiagent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator,
              Anthropic::Beta::BetaManagedAgentsSessionMultiagent20261001
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSessionMultiagent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COORDINATOR =
            T.let(
              :coordinator,
              Anthropic::Beta::BetaManagedAgentsSessionMultiagent::Type::TaggedSymbol
            )
          MULTIAGENT_20261001 =
            T.let(
              :multiagent_20261001,
              Anthropic::Beta::BetaManagedAgentsSessionMultiagent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionMultiagent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsSessionMultiagent::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsSessionMultiagent::Type::OrSymbol,
            agents:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAdvisor::OrHash
                )
              ],
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
              )
          ).returns(
            Anthropic::Beta::BetaManagedAgentsSessionMultiagent::Variants
          )
        end
        def self.new(
          type:,
          # Full `agent` definitions the coordinator may spawn as session threads.
          agents: nil,
          # Whether the session's primary thread can consult an advisor model.
          advisor: nil,
          # Whether the agent can spawn session threads.
          subagents: nil,
          # Whether the agent can start workflow runs.
          workflows: nil
        )
        end
      end
    end
  end
end
