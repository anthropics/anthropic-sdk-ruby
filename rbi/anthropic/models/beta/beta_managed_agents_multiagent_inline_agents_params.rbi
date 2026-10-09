# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentInlineAgentsParams =
      Beta::BetaManagedAgentsMultiagentInlineAgentsParams

    module Beta
      # Whether the agent can define inline agents. The agent defines an inline agent
      # itself, in a workflow run's plan or when it spawns a session thread, and the
      # inline agent is not saved.
      module BetaManagedAgentsMultiagentInlineAgentsParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams,
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams::Variants
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
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams::Type::OrSymbol
          ).returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams::Variants
          )
        end
        def self.new(type:)
        end
      end
    end
  end
end
