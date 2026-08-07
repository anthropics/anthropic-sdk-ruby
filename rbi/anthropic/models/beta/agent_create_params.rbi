# typed: strong

module Anthropic
  module Models
    module Beta
      class AgentCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::AgentCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Model identifier. Accepts the
        # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
        # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
        # control
        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
              String,
              Anthropic::Beta::BetaManagedAgentsModelConfigParams
            )
          )
        end
        attr_accessor :model

        # Human-readable name for the agent.
        sig { returns(String) }
        attr_accessor :name

        # Description of what the agent does.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # MCP servers this agent connects to. Maximum 20. Names must be unique within the
        # array. Every server must be referenced by an `mcp_toolset` in `tools`;
        # unreferenced servers are rejected. See the
        # [MCP connector guide](https://platform.claude.com/docs/en/managed-agents/mcp-connector).
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams]
            )
          )
        end
        attr_reader :mcp_servers

        sig do
          params(
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
              ]
          ).void
        end
        attr_writer :mcp_servers

        # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        # to 512 chars.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # A coordinator topology: the session's primary thread orchestrates work by
        # spawning session threads, each running an agent drawn from the `agents` roster.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsMultiagentParams))
        end
        attr_reader :multiagent

        sig do
          params(
            multiagent:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMultiagentParams::OrHash
              )
          ).void
        end
        attr_writer :multiagent

        # Skills available to the agent.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams,
                  Anthropic::Beta::BetaManagedAgentsCustomSkillParams
                )
              ]
            )
          )
        end
        attr_reader :skills

        sig do
          params(
            skills:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomSkillParams::OrHash
                )
              ]
          ).void
        end
        attr_writer :skills

        # System prompt for the agent.
        sig { returns(T.nilable(String)) }
        attr_accessor :system_

        # Tool configurations available to the agent. Maximum of 128 tools across all
        # toolsets allowed.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams
                )
              ]
            )
          )
        end
        attr_reader :tools

        sig do
          params(
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                )
              ]
          ).void
        end
        attr_writer :tools

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
          ).void
        end
        attr_writer :betas

        sig do
          params(
            model:
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                String,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::OrHash
              ),
            name: String,
            description: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
              ],
            metadata: T::Hash[Symbol, String],
            multiagent:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMultiagentParams::OrHash
              ),
            skills:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomSkillParams::OrHash
                )
              ],
            system_: T.nilable(String),
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                )
              ],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Model identifier. Accepts the
          # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
          # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
          # control
          model:,
          # Human-readable name for the agent.
          name:,
          # Description of what the agent does.
          description: nil,
          # MCP servers this agent connects to. Maximum 20. Names must be unique within the
          # array. Every server must be referenced by an `mcp_toolset` in `tools`;
          # unreferenced servers are rejected. See the
          # [MCP connector guide](https://platform.claude.com/docs/en/managed-agents/mcp-connector).
          mcp_servers: nil,
          # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
          # to 512 chars.
          metadata: nil,
          # A coordinator topology: the session's primary thread orchestrates work by
          # spawning session threads, each running an agent drawn from the `agents` roster.
          multiagent: nil,
          # Skills available to the agent.
          skills: nil,
          # System prompt for the agent.
          system_: nil,
          # Tool configurations available to the agent. Maximum of 128 tools across all
          # toolsets allowed.
          tools: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              model:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                  String,
                  Anthropic::Beta::BetaManagedAgentsModelConfigParams
                ),
              name: String,
              description: T.nilable(String),
              mcp_servers:
                T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams],
              metadata: T::Hash[Symbol, String],
              multiagent:
                T.nilable(Anthropic::Beta::BetaManagedAgentsMultiagentParams),
              skills:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams,
                    Anthropic::Beta::BetaManagedAgentsCustomSkillParams
                  )
                ],
              system_: T.nilable(String),
              tools:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                    Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                    Anthropic::Beta::BetaManagedAgentsCustomToolParams
                  )
                ],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Model identifier. Accepts the
        # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
        # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
        # control
        module Model
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::Variants,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::AgentCreateParams::Model::Variants]
            )
          end
          def self.variants
          end
        end

        # Union type for tool configurations in the tools array.
        module Tool
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                Anthropic::Beta::BetaManagedAgentsCustomToolParams
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::AgentCreateParams::Tool::Variants]
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
                    Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::OrHash
                  ],
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams::OrHash
                  ]
                ),
              default_config:
                T.any(
                  T.nilable(
                    Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams::OrHash
                  ),
                  T.nilable(
                    Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams::OrHash
                  )
                ),
              mcp_server_name: String,
              description: String,
              input_schema:
                Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::OrHash,
              name: String
            ).returns(Anthropic::Beta::AgentCreateParams::Tool::Variants)
          end
          def self.new(
            type:,
            # Per-tool configuration overrides.
            configs: nil,
            # Default configuration for all tools in a toolset.
            default_config: nil,
            # Name of the MCP server. Must match a server name from the mcp_servers array.
            # 1-255 characters.
            mcp_server_name: nil,
            # Description of what the tool does, shown to the agent to help it decide when to
            # use the tool.
            description: nil,
            # JSON Schema for custom tool input parameters.
            input_schema: nil,
            # Unique name for the tool. 1-128 characters; letters, digits, underscores, and
            # hyphens.
            name: nil
          )
          end
        end
      end
    end
  end
end
