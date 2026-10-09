# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsInlineAgent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent,
                Anthropic::Internal::AnyHash
              )
            end

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

          # The name that the agent's definition gave, or one that the server assigned.
          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Variants
              ]
            )
          end
          attr_accessor :skills

          sig { returns(T.nilable(String)) }
          attr_accessor :system_

          sig do
            returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Variants
              ]
            )
          end
          attr_accessor :tools

          sig { returns(Symbol) }
          attr_accessor :type

          # An agent that has no Agent resource, and so no `id` or `version`. It is defined
          # inline, in a workflow run's plan or when a session thread is spawned, and is not
          # saved.
          sig do
            params(
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
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            description:,
            mcp_servers:,
            # Model identifier and configuration.
            model:,
            # The name that the agent's definition gave, or one that the server assigned.
            name:,
            skills:,
            system_:,
            tools:,
            type: :inline
          )
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                mcp_servers:
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition
                  ],
                model: Anthropic::Beta::BetaManagedAgentsModelConfig,
                name: String,
                skills:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Variants
                  ],
                system_: T.nilable(String),
                tools:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Variants
                  ],
                type: Symbol
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
                    Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ANTHROPIC =
                T.let(
                  :anthropic,
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Type::TaggedSymbol
                )
              CUSTOM =
                T.let(
                  :custom,
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Type::OrSymbol,
                skill_id: String,
                version: String
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Skill::Variants
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
                    Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AGENT_TOOLSET_20260401 =
                T.let(
                  :agent_toolset_20260401,
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Type::TaggedSymbol
                )
              MCP_TOOLSET =
                T.let(
                  :mcp_toolset,
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Type::TaggedSymbol
                )
              CUSTOM =
                T.let(
                  :custom,
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Type::OrSymbol,
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
                Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent::Tool::Variants
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
        end
      end
    end
  end
end
