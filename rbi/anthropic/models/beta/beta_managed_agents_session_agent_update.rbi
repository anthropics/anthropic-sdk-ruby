# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionAgentUpdate =
      Beta::BetaManagedAgentsSessionAgentUpdate

    module Beta
      class BetaManagedAgentsSessionAgentUpdate < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate,
              Anthropic::Internal::AnyHash
            )
          end

        # Replacement MCP server list. Full replacement: the provided array becomes the
        # new value. Send an empty array to clear; omit to preserve.
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

        # Replacement tool list. Full replacement: the provided array becomes the new
        # value. Send an empty array to clear; omit to preserve.
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

        # Mid-session agent configuration update. Only `tools` and `mcp_servers` are
        # updatable. Full replacement: the provided array becomes the new value. To
        # preserve existing entries, GET the session, modify the array, and POST it back.
        sig do
          params(
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
              ],
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                )
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Replacement MCP server list. Full replacement: the provided array becomes the
          # new value. Send an empty array to clear; omit to preserve.
          mcp_servers: nil,
          # Replacement tool list. Full replacement: the provided array becomes the new
          # value. Send an empty array to clear; omit to preserve.
          tools: nil
        )
        end

        sig do
          override.returns(
            {
              mcp_servers:
                T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams],
              tools:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                    Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                    Anthropic::Beta::BetaManagedAgentsCustomToolParams
                  )
                ]
            }
          )
        end
        def to_hash
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_TOOLSET_20260401 =
              T.let(
                :agent_toolset_20260401,
                Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Type::TaggedSymbol
              )
            MCP_TOOLSET =
              T.let(
                :mcp_toolset,
                Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Type::TaggedSymbol
              )
            CUSTOM =
              T.let(
                :custom,
                Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Variants
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
                      Anthropic::Beta::BetaManagedAgentsBashToolConfigParams::OrHash,
                      Anthropic::Beta::BetaManagedAgentsEditToolConfigParams::OrHash,
                      Anthropic::Beta::BetaManagedAgentsReadToolConfigParams::OrHash,
                      Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams::OrHash,
                      Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams::OrHash,
                      Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::OrHash,
                      Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::OrHash,
                      Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::OrHash
                    )
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
            ).returns(
              Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Variants
            )
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
