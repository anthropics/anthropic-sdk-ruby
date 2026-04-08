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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMCPToolset::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            configs:
              T::Array[Anthropic::Beta::BetaManagedAgentsMCPToolConfig::OrHash],
            default_config:
              Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfig::OrHash,
            mcp_server_name: String,
            type: Anthropic::Beta::BetaManagedAgentsMCPToolset::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          configs:,
          # Resolved default configuration for all tools from an MCP server.
          default_config:,
          mcp_server_name:,
          type:
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
              type:
                Anthropic::Beta::BetaManagedAgentsMCPToolset::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsMCPToolset::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MCP_TOOLSET =
            T.let(
              :mcp_toolset,
              Anthropic::Beta::BetaManagedAgentsMCPToolset::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPToolset::Type::TaggedSymbol
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
