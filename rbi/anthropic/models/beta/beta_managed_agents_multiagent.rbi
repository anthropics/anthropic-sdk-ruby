# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagent = Beta::BetaManagedAgentsMultiagent

    module Beta
      class BetaManagedAgentsMultiagent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagent,
              Anthropic::Internal::AnyHash
            )
          end

        # Agents the coordinator may spawn as session threads, each resolved to a specific
        # version.
        sig do
          returns(T::Array[Anthropic::Beta::BetaManagedAgentsAgentReference])
        end
        attr_accessor :agents

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Resolved coordinator topology with a concrete agent roster.
        sig do
          params(
            agents:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash
              ],
            type: Anthropic::Beta::BetaManagedAgentsMultiagent::Type::OrSymbol
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
                T::Array[Anthropic::Beta::BetaManagedAgentsAgentReference],
              type:
                Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsMultiagent::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COORDINATOR =
            T.let(
              :coordinator,
              Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
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
