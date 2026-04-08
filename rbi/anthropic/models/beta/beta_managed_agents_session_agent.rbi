# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionAgent = Beta::BetaManagedAgentsSessionAgent

    module Beta
      class BetaManagedAgentsSessionAgent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionAgent,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig do
          returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition]
          )
        end
        attr_accessor :mcp_servers

        # Model identifier and configuration.
        sig { returns(Anthropic::Beta::BetaManagedAgentsModelConfig) }
        attr_reader :model

        sig do
          params(
            model: Anthropic::Beta::BetaManagedAgentsModelConfig::OrHash
          ).void
        end
        attr_writer :model

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsSessionAgent::Skill::Variants
            ]
          )
        end
        attr_accessor :skills

        sig { returns(T.nilable(String)) }
        attr_accessor :system_

        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsSessionAgent::Tool::Variants
            ]
          )
        end
        attr_accessor :tools

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionAgent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(Integer) }
        attr_accessor :version

        # Resolved `agent` definition for a `session`. Snapshot of the `agent` at
        # `session` creation time.
        sig do
          params(
            id: String,
            description: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::OrHash
              ],
            model: Anthropic::Beta::BetaManagedAgentsModelConfig::OrHash,
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
            type:
              Anthropic::Beta::BetaManagedAgentsSessionAgent::Type::OrSymbol,
            version: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          description:,
          mcp_servers:,
          # Model identifier and configuration.
          model:,
          name:,
          skills:,
          system_:,
          tools:,
          type:,
          version:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              description: T.nilable(String),
              mcp_servers:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition
                ],
              model: Anthropic::Beta::BetaManagedAgentsModelConfig,
              name: String,
              skills:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionAgent::Skill::Variants
                ],
              system_: T.nilable(String),
              tools:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionAgent::Tool::Variants
                ],
              type:
                Anthropic::Beta::BetaManagedAgentsSessionAgent::Type::TaggedSymbol,
              version: Integer
            }
          )
        end
        def to_hash
        end

        # Resolved skill as returned in API responses.
        module Skill
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsAnthropicSkill,
                Anthropic::Beta::BetaManagedAgentsCustomSkill
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionAgent::Skill::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Union type for tool configurations returned in API responses.
        module Tool
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401,
                Anthropic::Beta::BetaManagedAgentsMCPToolset,
                Anthropic::Beta::BetaManagedAgentsCustomTool
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionAgent::Tool::Variants
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
                Anthropic::Beta::BetaManagedAgentsSessionAgent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT =
            T.let(
              :agent,
              Anthropic::Beta::BetaManagedAgentsSessionAgent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionAgent::Type::TaggedSymbol
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
