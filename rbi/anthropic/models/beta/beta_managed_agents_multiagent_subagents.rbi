# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentSubagents =
      Beta::BetaManagedAgentsMultiagentSubagents

    module Beta
      # Whether the agent can spawn session threads.
      module BetaManagedAgentsMultiagentSubagents
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagents::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagents::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagents::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagents::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagents::Variants
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
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagents::Type::OrSymbol,
            inline_agents:
              T.any(
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled::OrHash,
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled::OrHash
              ),
            predefined_agents:
              T::Array[Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash]
          ).returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentSubagents::Variants
          )
        end
        def self.new(
          type:,
          # Whether the agent can define inline agents, which are not saved, when it spawns
          # session threads.
          inline_agents: nil,
          # Predefined agents, which are saved agents that this agent can spawn as session
          # threads, each resolved to a specific version.
          predefined_agents: nil
        )
        end
      end
    end
  end
end
