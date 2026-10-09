# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentWorkflows =
      Beta::BetaManagedAgentsMultiagentWorkflows

    module Beta
      # Whether the agent can start workflow runs.
      module BetaManagedAgentsMultiagentWorkflows
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows::Variants
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
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows::Type::OrSymbol,
            inline_agents:
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled::OrHash
              ),
            predefined_agents:
              T::Array[Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash]
          ).returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows::Variants
          )
        end
        def self.new(
          type:,
          # Whether a run's plan can define inline agents, which are not saved.
          inline_agents: nil,
          # Predefined agents, which are saved agents that a run's plan can use, each
          # resolved to a specific version.
          predefined_agents: nil
        )
        end
      end
    end
  end
end
