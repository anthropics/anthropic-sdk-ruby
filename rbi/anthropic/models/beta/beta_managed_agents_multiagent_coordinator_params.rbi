# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentCoordinatorParams =
      Beta::BetaManagedAgentsMultiagentCoordinatorParams

    module Beta
      class BetaManagedAgentsMultiagentCoordinatorParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentCoordinatorParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Agents the coordinator may spawn as session threads. 1–20 entries. Each entry is
        # an agent ID string, a versioned `{"type":"agent","id","version"}` reference, or
        # `{"type":"self"}` to allow recursive self-invocation. Entries must reference
        # distinct agents (after resolving `self` and string forms); at most one `self`.
        # Referenced agents must exist, must not be archived, and must not themselves have
        # `multiagent` set (depth limit 1).
        sig do
          returns(
            T::Array[
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentParams,
                Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams,
                Anthropic::Beta::BetaManagedAgentsAdvisorParams,
                String
              )
            ]
          )
        end
        attr_accessor :agents

        sig { returns(Symbol) }
        attr_accessor :type

        # A coordinator topology: the session's primary thread orchestrates work by
        # spawning session threads, each running an agent drawn from the `agents` roster.
        sig do
          params(
            agents:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAdvisorParams::OrHash,
                  String
                )
              ],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Agents the coordinator may spawn as session threads. 1–20 entries. Each entry is
          # an agent ID string, a versioned `{"type":"agent","id","version"}` reference, or
          # `{"type":"self"}` to allow recursive self-invocation. Entries must reference
          # distinct agents (after resolving `self` and string forms); at most one `self`.
          # Referenced agents must exist, must not be archived, and must not themselves have
          # `multiagent` set (depth limit 1).
          agents:,
          type: :coordinator
        )
        end

        sig do
          override.returns(
            {
              agents:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentParams,
                    Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams,
                    Anthropic::Beta::BetaManagedAgentsAdvisorParams,
                    String
                  )
                ],
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
