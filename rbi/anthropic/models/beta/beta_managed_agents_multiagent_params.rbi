# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentParams = Beta::BetaManagedAgentsMultiagentParams

    module Beta
      # Multiagent orchestration configuration.
      module BetaManagedAgentsMultiagentParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentCoordinatorParams,
              Anthropic::Beta::BetaManagedAgentsMultiagent20261001Params
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COORDINATOR =
            T.let(
              :coordinator,
              Anthropic::Beta::BetaManagedAgentsMultiagentParams::Type::TaggedSymbol
            )
          MULTIAGENT_20261001 =
            T.let(
              :multiagent_20261001,
              Anthropic::Beta::BetaManagedAgentsMultiagentParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentParams::Variants
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
              Anthropic::Beta::BetaManagedAgentsMultiagentParams::Type::OrSymbol,
            agents:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAdvisorParams::OrHash,
                  String
                )
              ],
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
              )
          ).returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentParams::Variants
          )
        end
        def self.new(
          type:,
          # Agents the coordinator may spawn as session threads. 1–20 entries. Each entry is
          # an agent ID string, a versioned `{"type":"agent","id","version"}` reference, or
          # `{"type":"self"}` to allow recursive self-invocation. Entries must reference
          # distinct agents (after resolving `self` and string forms); at most one `self`.
          # Referenced agents must exist, must not be archived, and must not themselves have
          # `multiagent` set (depth limit 1).
          agents: nil,
          # Whether the session's primary thread can consult an advisor model. Defaults to
          # disabled.
          advisor: nil,
          # Whether the agent can spawn session threads. Defaults to enabled.
          subagents: nil,
          # Whether the agent can start workflow runs. Defaults to enabled.
          workflows: nil
        )
        end
      end
    end
  end
end
