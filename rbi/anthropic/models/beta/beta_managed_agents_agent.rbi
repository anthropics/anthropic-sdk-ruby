# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgent = Beta::BetaManagedAgentsAgent

    module Beta
      class BetaManagedAgentsAgent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgent,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig do
          returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition]
          )
        end
        attr_accessor :mcp_servers

        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

        # Model identifier and configuration.
        sig { returns(Anthropic::Beta::BetaManagedAgentsModelConfig) }
        attr_reader :model

        sig do
          params(
            model: Anthropic::Beta::BetaManagedAgentsModelConfig::OrHash
          ).void
        end
        attr_writer :model

        # Resolved coordinator topology with a concrete agent roster.
        sig { returns(T.nilable(Anthropic::Beta::BetaManagedAgentsMultiagent)) }
        attr_reader :multiagent

        sig do
          params(
            multiagent:
              T.nilable(Anthropic::Beta::BetaManagedAgentsMultiagent::OrHash)
          ).void
        end
        attr_writer :multiagent

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsAgent::Skill::Variants]
          )
        end
        attr_accessor :skills

        sig { returns(T.nilable(String)) }
        attr_accessor :system_

        sig do
          returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsAgent::Tool::Variants]
          )
        end
        attr_accessor :tools

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsAgent::Type::TaggedSymbol)
        end
        attr_accessor :type

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :updated_at

        # The agent's current version. Starts at 1 and increments when the agent is
        # modified.
        sig { returns(Integer) }
        attr_accessor :version

        # A Managed Agents `agent`.
        sig do
          params(
            id: String,
            archived_at: T.nilable(Time),
            created_at: Time,
            description: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::OrHash
              ],
            metadata: T::Hash[Symbol, String],
            model: Anthropic::Beta::BetaManagedAgentsModelConfig::OrHash,
            multiagent:
              T.nilable(Anthropic::Beta::BetaManagedAgentsMultiagent::OrHash),
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
            type: Anthropic::Beta::BetaManagedAgentsAgent::Type::OrSymbol,
            updated_at: Time,
            version: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # A timestamp in RFC 3339 format
          archived_at:,
          # A timestamp in RFC 3339 format
          created_at:,
          description:,
          mcp_servers:,
          metadata:,
          # Model identifier and configuration.
          model:,
          # Resolved coordinator topology with a concrete agent roster.
          multiagent:,
          name:,
          skills:,
          system_:,
          tools:,
          type:,
          # A timestamp in RFC 3339 format
          updated_at:,
          # The agent's current version. Starts at 1 and increments when the agent is
          # modified.
          version:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(Time),
              created_at: Time,
              description: T.nilable(String),
              mcp_servers:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition
                ],
              metadata: T::Hash[Symbol, String],
              model: Anthropic::Beta::BetaManagedAgentsModelConfig,
              multiagent:
                T.nilable(Anthropic::Beta::BetaManagedAgentsMultiagent),
              name: String,
              skills:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsAgent::Skill::Variants
                ],
              system_: T.nilable(String),
              tools:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsAgent::Tool::Variants
                ],
              type: Anthropic::Beta::BetaManagedAgentsAgent::Type::TaggedSymbol,
              updated_at: Time,
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
              T::Array[Anthropic::Beta::BetaManagedAgentsAgent::Skill::Variants]
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
              T::Array[Anthropic::Beta::BetaManagedAgentsAgent::Tool::Variants]
            )
          end
          def self.variants
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsAgent::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT =
            T.let(
              :agent,
              Anthropic::Beta::BetaManagedAgentsAgent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgent::Type::TaggedSymbol
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
