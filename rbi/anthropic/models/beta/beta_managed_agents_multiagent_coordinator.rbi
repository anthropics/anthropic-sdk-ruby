# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentCoordinator =
      Beta::BetaManagedAgentsMultiagentCoordinator

    module Beta
      class BetaManagedAgentsMultiagentCoordinator < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator,
              Anthropic::Internal::AnyHash
            )
          end

        # Agents the coordinator may spawn as session threads, each resolved to a specific
        # version.
        sig do
          returns(
            T::Array[
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentReference,
                Anthropic::Beta::BetaManagedAgentsAdvisor
              )
            ]
          )
        end
        attr_accessor :agents

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Resolved coordinator topology with a concrete agent roster.
        sig do
          params(
            agents:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAdvisor::OrHash
                )
              ],
            type:
              Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Agents the coordinator may spawn as session threads, each resolved to a specific
          # version.
          agents:,
          type:
        )
        end

        sig do
          override.returns(
            {
              agents:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentReference,
                    Anthropic::Beta::BetaManagedAgentsAdvisor
                  )
                ],
              type:
                Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        # A resolved multiagent roster entry.
        module Agent
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentReference,
                Anthropic::Beta::BetaManagedAgentsAdvisor
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Agent::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COORDINATOR =
            T.let(
              :coordinator,
              Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
