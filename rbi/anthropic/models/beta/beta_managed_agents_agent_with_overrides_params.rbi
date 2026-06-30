# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentWithOverridesParams =
      Beta::BetaManagedAgentsAgentWithOverridesParams

    module Beta
      class BetaManagedAgentsAgentWithOverridesParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The `agent` ID.
        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Replacement MCP server list. Full replacement: the provided array becomes the
        # MCP servers. Send an empty array to clear; omit to preserve the agent's servers.
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

        # Replacement model. Accepts the model string, e.g. `claude-opus-4-6`, or a
        # `model_config` object. Omit to use the agent's model.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                String,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams
              )
            )
          )
        end
        attr_reader :model

        sig do
          params(
            model:
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                String,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::OrHash
              )
          ).void
        end
        attr_writer :model

        # Replacement skill list. Full replacement: the provided array becomes the skills.
        # Send an empty array to clear; omit to preserve the agent's skills.
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

        # Replacement system prompt. Up to 100,000 characters. Set to null to clear the
        # agent's system prompt; omit to preserve it.
        sig { returns(T.nilable(String)) }
        attr_accessor :system_

        # Replacement tool list. Full replacement: the provided array becomes the tool
        # configuration. Send an empty array to clear; omit to preserve the agent's tools.
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

        # The specific `agent` version to use. Omit to use the latest version.
        sig { returns(T.nilable(Integer)) }
        attr_reader :version

        sig { params(version: Integer).void }
        attr_writer :version

        # Reference to an `agent` plus optional configuration overrides. Each provided
        # field replaces the agent's value for the caller's use; the agent resource is
        # unchanged.
        sig do
          params(
            id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Type::OrSymbol,
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
              ],
            model:
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                String,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::OrHash
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
            version: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The `agent` ID.
          id:,
          type:,
          # Replacement MCP server list. Full replacement: the provided array becomes the
          # MCP servers. Send an empty array to clear; omit to preserve the agent's servers.
          mcp_servers: nil,
          # Replacement model. Accepts the model string, e.g. `claude-opus-4-6`, or a
          # `model_config` object. Omit to use the agent's model.
          model: nil,
          # Replacement skill list. Full replacement: the provided array becomes the skills.
          # Send an empty array to clear; omit to preserve the agent's skills.
          skills: nil,
          # Replacement system prompt. Up to 100,000 characters. Set to null to clear the
          # agent's system prompt; omit to preserve it.
          system_: nil,
          # Replacement tool list. Full replacement: the provided array becomes the tool
          # configuration. Send an empty array to clear; omit to preserve the agent's tools.
          tools: nil,
          # The specific `agent` version to use. Omit to use the latest version.
          version: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Type::OrSymbol,
              mcp_servers:
                T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams],
              model:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                  String,
                  Anthropic::Beta::BetaManagedAgentsModelConfigParams
                ),
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
              version: Integer
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
                Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_WITH_OVERRIDES =
            T.let(
              :agent_with_overrides,
              Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Replacement model. Accepts the model string, e.g. `claude-opus-4-6`, or a
        # `model_config` object. Omit to use the agent's model.
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
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Model::Variants
              ]
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
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::Tool::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
