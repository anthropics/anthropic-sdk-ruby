# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMCPToolsetParams = Beta::BetaManagedAgentsMCPToolsetParams

    module Beta
      class BetaManagedAgentsMCPToolsetParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the MCP server. Must match a server name from the mcp_servers array.
        # 1-255 characters.
        sig { returns(String) }
        attr_accessor :mcp_server_name

        sig { returns(Symbol) }
        attr_accessor :type

        # Per-tool configuration overrides.
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams]
            )
          )
        end
        attr_reader :configs

        sig do
          params(
            configs:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams::OrHash
              ]
          ).void
        end
        attr_writer :configs

        # Default configuration for all tools from this server.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams
            )
          )
        end
        attr_reader :default_config

        sig do
          params(
            default_config:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams::OrHash
              )
          ).void
        end
        attr_writer :default_config

        # Configuration for tools from an MCP server defined in `mcp_servers`.
        sig do
          params(
            mcp_server_name: String,
            configs:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams::OrHash
              ],
            default_config:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Name of the MCP server. Must match a server name from the mcp_servers array.
          # 1-255 characters.
          mcp_server_name:,
          # Per-tool configuration overrides.
          configs: nil,
          # Default configuration for all tools from this server.
          default_config: nil,
          type: :mcp_toolset
        )
        end

        sig do
          override.returns(
            {
              mcp_server_name: String,
              type: Symbol,
              configs:
                T::Array[Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams],
              default_config:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
