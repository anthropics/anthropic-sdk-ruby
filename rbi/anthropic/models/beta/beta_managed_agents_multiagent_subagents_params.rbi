# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentSubagentsParams =
      Beta::BetaManagedAgentsMultiagentSubagentsParams

    module Beta
      # Whether the agent can spawn session threads.
      module BetaManagedAgentsMultiagentSubagentsParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams,
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams::Variants
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
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams::Type::OrSymbol,
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
            Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams::Variants
          )
        end
        def self.new(
          type:,
          # Whether the agent can define inline agents when it spawns session threads.
          # Defaults to enabled.
          inline_agents: nil,
          # Predefined agents that this agent can spawn as session threads. At most 20.
          # Defaults to null. Null and an empty list both mean no predefined agents. This
          # list is separate from `workflows.predefined_agents`, and an agent in one list is
          # not added to the other.
          predefined_agents: nil
        )
        end
      end
    end
  end
end
