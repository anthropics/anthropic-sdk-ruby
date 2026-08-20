# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionThreadAgent =
      Beta::BetaManagedAgentsSessionThreadAgent

    module Beta
      class BetaManagedAgentsSessionThreadAgent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent,
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
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Variants
            ]
          )
        end
        attr_accessor :skills

        sig { returns(T.nilable(String)) }
        attr_accessor :system_

        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Variants
            ]
          )
        end
        attr_accessor :tools

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(Integer) }
        attr_accessor :version

        # Resolved `agent` definition for a single `session_thread`. Snapshot of the agent
        # at thread creation time. The multiagent roster is not repeated here; read it
        # from `Session.agent`.
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
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Type::OrSymbol,
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
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Variants
                ],
              system_: T.nilable(String),
              tools:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Variants
                ],
              type:
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Type::TaggedSymbol,
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ANTHROPIC =
              T.let(
                :anthropic,
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Type::TaggedSymbol
              )
            CUSTOM =
              T.let(
                :custom,
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Variants
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
              skill_id: String,
              version: String
            ).returns(
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Skill::Variants
            )
          end
          def self.new(type:, skill_id:, version:)
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_TOOLSET_20260401 =
              T.let(
                :agent_toolset_20260401,
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Type::TaggedSymbol
              )
            MCP_TOOLSET =
              T.let(
                :mcp_toolset,
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Type::TaggedSymbol
              )
            CUSTOM =
              T.let(
                :custom,
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Variants
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
              configs:
                T.any(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaManagedAgentsBashToolConfig::OrHash,
                      Anthropic::Beta::BetaManagedAgentsEditToolConfig::OrHash,
                      Anthropic::Beta::BetaManagedAgentsReadToolConfig::OrHash,
                      Anthropic::Beta::BetaManagedAgentsWriteToolConfig::OrHash,
                      Anthropic::Beta::BetaManagedAgentsGlobToolConfig::OrHash,
                      Anthropic::Beta::BetaManagedAgentsGrepToolConfig::OrHash,
                      Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::OrHash,
                      Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig::OrHash
                    )
                  ],
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsMCPToolConfig::OrHash
                  ]
                ),
              default_config:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfig::OrHash
                ),
              mcp_server_name: String,
              description: String,
              input_schema:
                Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::OrHash,
              name: String
            ).returns(
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Tool::Variants
            )
          end
          def self.new(
            type:,
            configs: nil,
            # Resolved default configuration for agent tools.
            default_config: nil,
            mcp_server_name: nil,
            description: nil,
            # JSON Schema for custom tool input parameters.
            input_schema: nil,
            name: nil
          )
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT =
            T.let(
              :agent,
              Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::Type::TaggedSymbol
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
