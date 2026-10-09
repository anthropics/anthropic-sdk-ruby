# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionMultiagentSubagents =
      Beta::BetaManagedAgentsSessionMultiagentSubagents

    module Beta
      # Whether the agent can spawn session threads.
      module BetaManagedAgentsSessionMultiagentSubagents
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Variants
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
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Type::OrSymbol,
            inline_agents:
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled::OrHash
              ),
            predefined_agents:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::OrHash
              ]
          ).returns(
            Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagents::Variants
          )
        end
        def self.new(
          type:,
          # Whether the agent can define inline agents, which are not saved, when it spawns
          # session threads.
          inline_agents: nil,
          # Full `agent` definitions of the predefined agents, which are saved agents that
          # this agent can spawn as session threads.
          predefined_agents: nil
        )
        end
      end
    end
  end
end
