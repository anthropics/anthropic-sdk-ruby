# typed: strong

module Anthropic
  module Models
    module Beta
      class AgentUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::AgentUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :agent_id

        # The agent's current version, used to prevent concurrent overwrites. Obtain this
        # value from a create or retrieve response. The request fails if this does not
        # match the server's current version.
        sig { returns(Integer) }
        attr_accessor :version

        # Description. Up to 2048 characters. Omit to preserve; send empty string or null
        # to clear.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # MCP servers. Full replacement. Omit to preserve; send empty array or null to
        # clear. Names must be unique. Maximum 20.
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams]
            )
          )
        end
        attr_accessor :mcp_servers

        # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        # Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
        # each) with values up to 512 chars.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

        # Model identifier. Accepts the
        # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
        # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
        # control. Omit to preserve. Cannot be cleared.
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

        # Human-readable name. 1-256 characters. Omit to preserve. Cannot be cleared.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Skills. Full replacement. Omit to preserve; send empty array or null to clear.
        # Maximum 20.
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
        attr_accessor :skills

        # System prompt. Up to 100,000 characters. Omit to preserve; send empty string or
        # null to clear.
        sig { returns(T.nilable(String)) }
        attr_accessor :system_

        # Tool configurations available to the agent. Full replacement. Omit to preserve;
        # send empty array or null to clear. Maximum of 128 tools across all toolsets
        # allowed.
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
        attr_accessor :tools

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
            agent_id: String,
            version: Integer,
            description: T.nilable(String),
            mcp_servers:
              T.nilable(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
                ]
              ),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            model:
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                String,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::OrHash
              ),
            name: String,
            skills:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCustomSkillParams::OrHash
                  )
                ]
              ),
            system_: T.nilable(String),
            tools:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                    Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                  )
                ]
              ),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          agent_id:,
          # The agent's current version, used to prevent concurrent overwrites. Obtain this
          # value from a create or retrieve response. The request fails if this does not
          # match the server's current version.
          version:,
          # Description. Up to 2048 characters. Omit to preserve; send empty string or null
          # to clear.
          description: nil,
          # MCP servers. Full replacement. Omit to preserve; send empty array or null to
          # clear. Names must be unique. Maximum 20.
          mcp_servers: nil,
          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
          # each) with values up to 512 chars.
          metadata: nil,
          # Model identifier. Accepts the
          # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
          # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
          # control. Omit to preserve. Cannot be cleared.
          model: nil,
          # Human-readable name. 1-256 characters. Omit to preserve. Cannot be cleared.
          name: nil,
          # Skills. Full replacement. Omit to preserve; send empty array or null to clear.
          # Maximum 20.
          skills: nil,
          # System prompt. Up to 100,000 characters. Omit to preserve; send empty string or
          # null to clear.
          system_: nil,
          # Tool configurations available to the agent. Full replacement. Omit to preserve;
          # send empty array or null to clear. Maximum of 128 tools across all toolsets
          # allowed.
          tools: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              agent_id: String,
              version: Integer,
              description: T.nilable(String),
              mcp_servers:
                T.nilable(
                  T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams]
                ),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              model:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                  String,
                  Anthropic::Beta::BetaManagedAgentsModelConfigParams
                ),
              name: String,
              skills:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams,
                      Anthropic::Beta::BetaManagedAgentsCustomSkillParams
                    )
                  ]
                ),
              system_: T.nilable(String),
              tools:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                      Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                      Anthropic::Beta::BetaManagedAgentsCustomToolParams
                    )
                  ]
                ),
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
        # control. Omit to preserve. Cannot be cleared.
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
              T::Array[Anthropic::Beta::AgentUpdateParams::Model::Variants]
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
              T::Array[Anthropic::Beta::AgentUpdateParams::Tool::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
