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
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Variants
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
                T.any(
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAdvisor::OrHash
                )
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
                  Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Variants
                ],
              type:
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # A session-resolved multiagent roster entry.
        module Agent
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent,
                Anthropic::Beta::BetaManagedAgentsAdvisor
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT =
              T.let(
                :agent,
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Type::TaggedSymbol
              )
            ADVISOR =
              T.let(
                :advisor,
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Variants
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
              model:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsModelConfig::OrHash,
                  String
                ),
              id: String,
              description: T.nilable(String),
              mcp_servers:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::OrHash
                ],
              name: String,
              skills:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAnthropicSkill::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCustomSkill::OrHash
                  )
                ],
              system_: T.nilable(String),
              tools:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::OrHash,
                    Anthropic::Beta::BetaManagedAgentsMCPToolset::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCustomTool::OrHash
                  )
                ],
              version: Integer
            ).returns(
              Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator::Agent::Variants
            )
          end
          def self.new(
            type:,
            # Model identifier and configuration.
            model:,
            id: nil,
            description: nil,
            mcp_servers: nil,
            name: nil,
            skills: nil,
            system_: nil,
            tools: nil,
            version: nil
          )
          end
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
