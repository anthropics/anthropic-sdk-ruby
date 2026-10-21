# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMCPToolset = Beta::BetaManagedAgentsMCPToolset

    module Beta
      class BetaManagedAgentsMCPToolset < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMCPToolset,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[Anthropic::Beta::BetaManagedAgentsMCPToolConfig])
        end
        attr_accessor :configs

        # Resolved default configuration for all tools from an MCP server.
        sig do
          returns(Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfig)
        end
        attr_reader :default_config

        sig do
          params(
            default_config:
              Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfig::OrHash
          ).void
        end
        attr_writer :default_config

        sig { returns(String) }
        attr_accessor :mcp_server_name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            configs:
              T::Array[Anthropic::Beta::BetaManagedAgentsMCPToolConfig::OrHash],
            default_config:
              Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfig::OrHash,
            mcp_server_name: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          configs:,
          # Resolved default configuration for all tools from an MCP server.
          default_config:,
          mcp_server_name:,
          type: :mcp_toolset
        )
        end

        sig do
          override.returns(
            {
              configs:
                T::Array[Anthropic::Beta::BetaManagedAgentsMCPToolConfig],
              default_config:
                Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfig,
              mcp_server_name: String,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
