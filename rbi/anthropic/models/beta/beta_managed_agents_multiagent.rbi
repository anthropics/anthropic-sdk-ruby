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
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Variants
            ]
          )
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
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAdvisor::OrHash
                )
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
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Variants
                ],
              type:
                Anthropic::Beta::BetaManagedAgentsMultiagent::Type::TaggedSymbol
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT =
              T.let(
                :agent,
                Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Type::TaggedSymbol
              )
            ADVISOR =
              T.let(
                :advisor,
                Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              id: String,
              version: Integer,
              model: String
            ).returns(
              Anthropic::Beta::BetaManagedAgentsMultiagent::Agent::Variants
            )
          end
          def self.new(
            type:,
            id: nil,
            version: nil,
            # The advisor model id.
            model: nil
          )
          end
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
