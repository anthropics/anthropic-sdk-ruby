# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagent = Beta::BetaManagedAgentsMultiagent

    module Beta
      # Resolved multiagent orchestration configuration as returned in API responses.
      module BetaManagedAgentsMultiagent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator,
              Anthropic::Beta::BetaManagedAgentsMultiagent20261001
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsMultiagent::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COORDINATOR =
            T.let(
              :coordinator,
              Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
            )
          MULTIAGENT_20261001 =
            T.let(
              :multiagent_20261001,
              Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsMultiagent::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaManagedAgentsMultiagent::Type::OrSymbol,
            agents:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash,
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
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled::OrHash
              ),
            workflows:
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled::OrHash
              )
          ).returns(Anthropic::Beta::BetaManagedAgentsMultiagent::Variants)
        end
        def self.new(
          type:,
          # Agents the coordinator may spawn as session threads, each resolved to a specific
          # version.
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
