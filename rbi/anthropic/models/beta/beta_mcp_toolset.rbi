# typed: strong

module Anthropic
  module Models
    BetaMCPToolset = Beta::BetaMCPToolset

    module Beta
      class BetaMCPToolset < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaMCPToolset, Anthropic::Internal::AnyHash)
          end

        # Name of the MCP server to configure tools for
        sig { returns(String) }
        attr_accessor :mcp_server_name

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # Configuration overrides for specific tools, keyed by tool name
        sig do
          returns(
            T.nilable(T::Hash[Symbol, Anthropic::Beta::BetaMCPToolConfig])
          )
        end
        attr_accessor :configs

        # Default configuration applied to all tools from this server
        sig { returns(T.nilable(Anthropic::Beta::BetaMCPToolDefaultConfig)) }
        attr_reader :default_config

        sig do
          params(
            default_config: Anthropic::Beta::BetaMCPToolDefaultConfig::OrHash
          ).void
        end
        attr_writer :default_config

        # Configuration for a group of tools from an MCP server.
        #
        # Allows configuring enabled status and defer_loading for all tools from an MCP
        # server, with optional per-tool overrides.
        sig do
          params(
            mcp_server_name: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            configs:
              T.nilable(
                T::Hash[Symbol, Anthropic::Beta::BetaMCPToolConfig::OrHash]
              ),
            default_config: Anthropic::Beta::BetaMCPToolDefaultConfig::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Name of the MCP server to configure tools for
          mcp_server_name:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Configuration overrides for specific tools, keyed by tool name
          configs: nil,
          # Default configuration applied to all tools from this server
          default_config: nil,
          type: :mcp_toolset
        )
        end

        sig do
          override.returns(
            {
              mcp_server_name: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              configs:
                T.nilable(T::Hash[Symbol, Anthropic::Beta::BetaMCPToolConfig]),
              default_config: Anthropic::Beta::BetaMCPToolDefaultConfig
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
