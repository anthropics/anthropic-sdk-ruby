# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionMultiagentCoordinator =
      Beta::BetaManagedAgentsSessionMultiagentCoordinator

    module Beta
      class BetaManagedAgentsSessionMultiagentCoordinator < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator,
              Anthropic::Internal::AnyHash
            )
          end

        # Full `agent` definitions the coordinator may spawn as session threads.
        sig do
          returns(
            T::Array[
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent
            ]
          )
        end
        attr_accessor :agents

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Resolved coordinator topology with full agent definitions for each roster
        # member.
        sig do
          params(
            agents:
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent::OrHash
              ],
            type:
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Full `agent` definitions the coordinator may spawn as session threads.
          agents:,
          type:
        )
        end

        sig do
          override.returns(
            {
              agents:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent
                ],
              type:
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COORDINATOR =
            T.let(
              :coordinator,
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type::TaggedSymbol
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
