# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentWorkflowsParams =
      Beta::BetaManagedAgentsMultiagentWorkflowsParams

    module Beta
      # Whether the agent can start workflow runs.
      module BetaManagedAgentsMultiagentWorkflowsParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams,
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Variants
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
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Type::OrSymbol,
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
              )
          ).returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Variants
          )
        end
        def self.new(
          type:,
          # Whether a run's plan can define inline agents. Defaults to enabled.
          inline_agents: nil,
          # Predefined agents that a run's plan can use. At most 20. Defaults to null. Null
          # and an empty list both mean no predefined agents. This list is separate from
          # `subagents.predefined_agents`, and an agent in one list is not added to the
          # other.
          predefined_agents: nil
        )
        end
      end
    end
  end
end
