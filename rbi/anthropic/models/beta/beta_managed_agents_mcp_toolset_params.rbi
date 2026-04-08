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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::Type::OrSymbol
          )
        end
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

        # Default configuration for all tools from an MCP server.
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
            type:
              Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::Type::OrSymbol,
            configs:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams::OrHash
              ],
            default_config:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Name of the MCP server. Must match a server name from the mcp_servers array.
          # 1-255 characters.
          mcp_server_name:,
          type:,
          # Per-tool configuration overrides.
          configs: nil,
          # Default configuration for all tools from an MCP server.
          default_config: nil
        )
        end

        sig do
          override.returns(
            {
              mcp_server_name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::Type::OrSymbol,
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

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MCP_TOOLSET =
            T.let(
              :mcp_toolset,
              Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::Type::TaggedSymbol
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
